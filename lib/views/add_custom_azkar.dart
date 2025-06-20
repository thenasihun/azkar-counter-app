import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:azkar_counter/models/azkar_model.dart';
import 'package:azkar_counter/providers/azkar_provider.dart';

class AddCustomAzkarScreen extends StatefulWidget {
  const AddCustomAzkarScreen({super.key});

  @override
  _AddCustomAzkarScreenState createState() => _AddCustomAzkarScreenState();
}

class _AddCustomAzkarScreenState extends State<AddCustomAzkarScreen> {
  final _formKey = GlobalKey<FormState>();
  final _arabicController = TextEditingController();
  final _transliterationController = TextEditingController();
  final _meaningController = TextEditingController();

  @override
  void dispose() {
    _arabicController.dispose();
    _transliterationController.dispose();
    _meaningController.dispose();
    super.dispose();
  }

  void _saveAzkar() {
    // First, run validation for the required fields.
    if (_formKey.currentState!.validate()) {
      // If transliteration is empty, use the Arabic text as the title.
      final title = _transliterationController.text.trim().isNotEmpty
          ? _transliterationController.text.trim()
          : _arabicController.text.trim();

      final newAzkar = AzkarModel(
        arabic: _arabicController.text.trim(),
        title: title,
        meaning: _meaningController.text.trim(),
        isCustom: true,
        lastUpdated: DateTime.now(),
      );
      Provider.of<AzkarProvider>(context, listen: false).addAzkar(newAzkar);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Add New Azkar',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
                const SizedBox(height: 24),
                // Arabic text is the only mandatory field.
                _buildTextFormField(
                  context: context,
                  controller: _arabicController,
                  labelText: 'Arabic Text',
                  hintText: 'أدخل النص العربي هنا',
                  isArabic: true,
                  isMandatory: true,
                ),
                const SizedBox(height: 16),
                // Transliteration is now optional.
                _buildTextFormField(
                  context: context,
                  controller: _transliterationController,
                  labelText: 'Transliteration (Optional)',
                  hintText: 'If empty, Arabic text is used as title',
                ),
                const SizedBox(height: 16),
                // Meaning is now optional.
                _buildTextFormField(
                  context: context,
                  controller: _meaningController,
                  labelText: 'Meaning (Optional)',
                  hintText: 'Enter the meaning',
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _saveAzkar,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text('Save Azkar',
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onPrimary)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text('Cancel',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.7))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Updated helper function to handle optional validation.
  Widget _buildTextFormField({
    required BuildContext context,
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    bool isArabic = false,
    bool isMandatory = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          textAlign: isArabic ? TextAlign.right : TextAlign.left,
          style: TextStyle(
              fontFamily: 'NotoNaskhArabic',
              fontSize: isArabic ? 18 : 16,
              color: Theme.of(context).colorScheme.onSurface),
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          // Validator only runs if the field is mandatory.
          validator: isMandatory
              ? (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                }
              : null,
        ),
      ],
    );
  }
}
