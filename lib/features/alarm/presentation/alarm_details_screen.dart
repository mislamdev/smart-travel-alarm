import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/app_gradient_background.dart';
import '../../../../helpers/date_time_formatters.dart';
import '../../location/data/location_service.dart';
import '../domain/alarm.dart';
import 'alarm_controller.dart';

class AlarmDetailsScreen extends ConsumerStatefulWidget {
  final Alarm alarm;

  const AlarmDetailsScreen({super.key, required this.alarm});

  @override
  ConsumerState<AlarmDetailsScreen> createState() => _AlarmDetailsScreenState();
}

class _AlarmDetailsScreenState extends ConsumerState<AlarmDetailsScreen> {
  bool _isEditMode = false;
  late TextEditingController _titleController;
  late TextEditingController _locationController;
  late TextEditingController _descriptionController;
  late DateTime _selectedDateTime;
  late Alarm _currentAlarm; // Track current alarm state
  final _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    _currentAlarm = widget.alarm; // Initialize with widget alarm
    _titleController = TextEditingController(text: _currentAlarm.title ?? '');
    _locationController = TextEditingController(
      text: _currentAlarm.location ?? '',
    );
    _descriptionController = TextEditingController(
      text: _currentAlarm.description ?? '',
    );
    _selectedDateTime = _currentAlarm.scheduledAt;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // ...existing code...

  Future<void> _fetchCurrentLocation() async {
    try {
      // Show loading
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Fetching current location...'),
            duration: Duration(seconds: 2),
          ),
        );
      }

      final result = await _locationService.getCurrentLocation();
      final locationString =
          'Lat: ${result.latitude.toStringAsFixed(4)}, '
          'Lng: ${result.longitude.toStringAsFixed(4)}';

      setState(() {
        _locationController.text = locationString;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Location updated')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      }
    }
  }

  void _showLocationOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A2E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Location',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Use Current GPS Location
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF6A00FF).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.my_location, color: Color(0xFF6A00FF)),
              ),
              title: const Text(
                'Use Current GPS Location',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Get your current location coordinates',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontSize: 13,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                _fetchCurrentLocation();
              },
            ),

            const SizedBox(height: 12),

            // Enter Place Name
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF6A00FF).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.edit_location_alt,
                  color: Color(0xFF6A00FF),
                ),
              ),
              title: const Text(
                'Enter Place Name',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Type a location name manually',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontSize: 13,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                // Focus on text field (it's already focused in edit mode)
              },
            ),

            const SizedBox(height: 12),

            // Enter GPS Coordinates
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF6A00FF).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.pin_drop, color: Color(0xFF6A00FF)),
              ),
              title: const Text(
                'Enter GPS Coordinates',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Enter latitude and longitude manually',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontSize: 13,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                _showCoordinatesDialog();
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showCoordinatesDialog() {
    final latController = TextEditingController();
    final lngController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        title: const Text(
          'Enter GPS Coordinates',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: latController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Latitude',
                labelStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                ),
                hintText: 'e.g., 23.8103',
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.3),
                ),
                filled: true,
                fillColor: Colors.white.withValues(alpha: 0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFF6A00FF),
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: lngController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Longitude',
                labelStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                ),
                hintText: 'e.g., 90.4125',
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.3),
                ),
                filled: true,
                fillColor: Colors.white.withValues(alpha: 0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFF6A00FF),
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final lat = latController.text.trim();
              final lng = lngController.text.trim();

              if (lat.isNotEmpty && lng.isNotEmpty) {
                setState(() {
                  _locationController.text = 'Lat: $lat, Lng: $lng';
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Coordinates added')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter both coordinates'),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6A00FF),
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDateTime() async {
    final now = DateTime.now();

    final date = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
      initialDate: _selectedDateTime,
    );
    if (date == null) return;

    if (!mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
    );
    if (time == null) return;

    final dt = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    setState(() {
      _selectedDateTime = dt;
    });
  }

  void _toggleEditMode() {
    setState(() {
      _isEditMode = !_isEditMode;
      if (!_isEditMode) {
        // Reset to current values when canceling
        _titleController.text = _currentAlarm.title ?? '';
        _locationController.text = _currentAlarm.location ?? '';
        _descriptionController.text = _currentAlarm.description ?? '';
        _selectedDateTime = _currentAlarm.scheduledAt;
      }
    });
  }

  Future<void> _saveChanges() async {
    // Create updated alarm with same ID
    final updatedAlarm = _currentAlarm.copyWith(
      scheduledAt: _selectedDateTime,
      title: _titleController.text.trim().isEmpty
          ? null
          : _titleController.text.trim(),
      location: _locationController.text.trim().isEmpty
          ? null
          : _locationController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
    );

    try {
      // Update the alarm in database
      await ref.read(alarmsControllerProvider.notifier).updateAlarm(updatedAlarm);

      // Update local state with the saved alarm and exit edit mode
      if (!mounted) return;

      setState(() {
        _currentAlarm = updatedAlarm;
        _isEditMode = false;
      });

      // Show success message after state update
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Alarm updated successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      // Handle error
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update alarm: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          _isEditMode ? 'Edit Alarm' : 'Alarm Details',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          if (_isEditMode) ...[
            // Cancel button in edit mode
            TextButton(
              onPressed: _toggleEditMode,
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // Save button in edit mode
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: _saveChanges,
              tooltip: 'Save',
            ),
          ] else ...[
            // Edit button in view mode
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: _toggleEditMode,
              tooltip: 'Edit',
            ),
            // Delete button in view mode
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () async {
                final shouldDelete = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Delete Alarm'),
                    content: const Text(
                      'Are you sure you want to delete this alarm?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                );

                if (shouldDelete == true && context.mounted) {
                  ref
                      .read(alarmsControllerProvider.notifier)
                      .deleteAlarm(widget.alarm.id);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Alarm deleted')),
                  );
                }
              },
              tooltip: 'Delete',
            ),
          ],
        ],
      ),
      extendBodyBehindAppBar: true,
      body: AppGradientBackground(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 100),

            // Time Display
            Center(
              child: InkWell(
                onTap: _isEditMode ? _pickDateTime : null,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _isEditMode
                          ? const Color(0xFF6A00FF)
                          : Colors.white.withValues(alpha: 0.2),
                      width: _isEditMode ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            DateTimeFormatters.time(_selectedDateTime),
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          if (_isEditMode) ...[
                            const SizedBox(width: 12),
                            Icon(
                              Icons.edit,
                              color: Colors.white.withValues(alpha: 0.7),
                              size: 24,
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        DateTimeFormatters.date(_selectedDateTime),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Enable/Disable Switch
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Alarm Status',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Switch(
                    value: _currentAlarm.enabled,
                    onChanged: (value) {
                      ref
                          .read(alarmsControllerProvider.notifier)
                          .toggleAlarm(_currentAlarm.id, value);
                      // Update local state
                      setState(() {
                        _currentAlarm = _currentAlarm.copyWith(enabled: value);
                      });
                    },
                    activeColor: Colors.white,
                    activeTrackColor: const Color(0xFF5200FF),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.white.withValues(alpha: 0.2),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Title Field
            _isEditMode
                ? _buildEditField(
                    icon: Icons.title,
                    label: 'Title',
                    controller: _titleController,
                    hint: 'e.g., Morning Alarm',
                  )
                : (_currentAlarm.title != null && _currentAlarm.title!.isNotEmpty)
                    ? _buildDetailCard(
                        icon: Icons.title,
                        label: 'Title',
                        value: _currentAlarm.title!,
                      )
                    : const SizedBox.shrink(),

            const SizedBox(height: 16),

            // Location Field
            _isEditMode
                ? _buildLocationEditField()
                : (_currentAlarm.location != null &&
                        _currentAlarm.location!.isNotEmpty)
                    ? _buildDetailCard(
                        icon: Icons.location_on_outlined,
                        label: 'Location',
                        value: _currentAlarm.location!,
                      )
                    : const SizedBox.shrink(),

            const SizedBox(height: 16),

            // Description Field
            _isEditMode
                ? _buildEditField(
                    icon: Icons.description_outlined,
                    label: 'Description',
                    controller: _descriptionController,
                    hint: 'Add notes or description...',
                    maxLines: 3,
                  )
                : (_currentAlarm.description != null &&
                        _currentAlarm.description!.isNotEmpty)
                    ? _buildDetailCard(
                        icon: Icons.description_outlined,
                        label: 'Description',
                        value: _currentAlarm.description!,
                        isMultiline: true,
                      )
                    : const SizedBox.shrink(),

            const SizedBox(height: 16),

            // Created Info
            _buildInfoSection(),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard({
    required IconData icon,
    required String label,
    required String value,
    bool isMultiline = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF6A00FF), size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditField({
    required IconData icon,
    required String label,
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xFF6A00FF), size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.6),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.3)),
            filled: true,
            fillColor: Colors.white.withValues(alpha: 0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.2),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF6A00FF), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationEditField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Color(0xFF6A00FF),
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Location',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.6),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _locationController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'e.g., Office, Home',
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF6A00FF),
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Location options button
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF6A00FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: _showLocationOptions,
                icon: const Icon(Icons.add_location_alt, color: Colors.white),
                tooltip: 'Location Options',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.white.withValues(alpha: 0.5),
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                'Information',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildInfoRow('Alarm ID', _currentAlarm.id.toString()),
          const SizedBox(height: 8),
          _buildInfoRow(
            'Status',
            _currentAlarm.enabled ? 'Active' : 'Inactive',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withValues(alpha: 0.5),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withValues(alpha: 0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
