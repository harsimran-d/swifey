import 'package:flutter/material.dart';
import 'package:swifey/src/common/widgets/buttons/primary_button.dart';

class CreateProfilePage extends StatefulWidget {
  static MaterialPageRoute<void> get route =>
      MaterialPageRoute(builder: (context) => const CreateProfilePage());
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final _dobDayController = TextEditingController();
  final _dobMonthController = TextEditingController();
  final _dobYearController = TextEditingController();
  final _schoolController = TextEditingController();
  final _workPlaceController = TextEditingController();
  final _jobTitleController = TextEditingController();

  final List<String> _genderChoices = ["Male", "Female"];
  final List<String> _sexualOrientationChoices = [
    "Straight",
    "Gay",
    "Lesbian",
    "Bisexual"
  ];

  String? _selectedGender;
  String? _selectedSexualOrientation;

  bool _showGenderError = false;
  bool _showSexualOrientationError = false;

  @override
  void dispose() {
    _dobDayController.dispose();
    _dobMonthController.dispose();
    _dobYearController.dispose();
    _schoolController.dispose();
    _workPlaceController.dispose();
    _jobTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Sign Up"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Date of Birth  DD/MM/YYYY",
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              controller: _dobDayController,
                              maxLength: 2,
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              decoration:
                                  const InputDecoration(counterText: ""),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Day of birth cannot be empty";
                                }
                                return "";
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              "/",
                              style: TextStyle(fontSize: 28),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              controller: _dobMonthController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              decoration:
                                  const InputDecoration(counterText: ""),
                              maxLength: 2,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Month of birth cannot be empty";
                                }
                                return "";
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              "/",
                              style: TextStyle(fontSize: 28),
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            child: TextFormField(
                              controller: _dobYearController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              decoration:
                                  const InputDecoration(counterText: ""),
                              maxLength: 4,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Year of birth cannot be empty";
                                }
                                return "";
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Gender",
                        style: TextStyle(fontSize: 20),
                      ),
                      Wrap(
                        spacing: 10,
                        children: _genderChoices
                            .map((gender) => ChoiceChip(
                                  showCheckmark: false,
                                  label: Text(gender),
                                  selected: _selectedGender == gender,
                                  onSelected: (_) {
                                    setState(() {
                                      _selectedGender = gender;
                                      _showGenderError = false;
                                    });
                                  },
                                ))
                            .toList(),
                      ),
                      if (_showGenderError)
                        const Text(
                          "Please select a gender.",
                          style: TextStyle(color: Colors.red),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Sexual Orientation",
                        style: TextStyle(fontSize: 20),
                      ),
                      Wrap(
                        spacing: 10,
                        children: _sexualOrientationChoices.map((orientation) {
                          return ChoiceChip(
                            showCheckmark: false,
                            label: Text(orientation),
                            selected: _selectedSexualOrientation == orientation,
                            onSelected: (value) {
                              setState(() {
                                _selectedSexualOrientation = orientation;
                                _showSexualOrientationError = false;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      if (_showSexualOrientationError)
                        const Text(
                          "Please a select a sexual orientation",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Educational Institute",
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        "Past or Current.",
                        style: TextStyle(fontSize: 10),
                      ),
                      TextFormField(
                        controller: _schoolController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "School cannot be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Working at",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        controller: _workPlaceController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Workplace cannot be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Working as",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        controller: _jobTitleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Job Title cannot be empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  )),
                ),
              ),
              PrimaryButton(
                disabled: false,
                onPressed: () {
                  setState(() {
                    _showGenderError = _selectedGender == null;
                    _showSexualOrientationError =
                        _selectedSexualOrientation == null;
                  });
                  if (_formKey.currentState!.validate()) {}
                },
                buttonText: 'Create Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
