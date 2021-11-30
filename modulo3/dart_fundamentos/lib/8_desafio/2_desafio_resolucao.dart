void main() {

  //! Detalhe sobre a String
  //! A String é composta por 4 campos (Nome|Idade|Profissão|Estado onde mora)
  // ignore: unused_local_variable
  final patients = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];

  //! Baseado no array acima monte um relatório onde:
  //! 1 - Apresente os pacientes com mais de 20 anos e print o nome deles
  //! 2 - Apresente quantos pacientes existem para cada profissão (desenvolvedor, estudante, dentista, jornalista)
  //! 3 - Apresente a quantidade de pacientes que moram em SP

  PatientModel _getDataOnModel(String joinedInfo) {
    final infoOnArray = joinedInfo.split('|');
    final patientModel = PatientModel(
      name: infoOnArray[0], 
      age: int.tryParse(infoOnArray[1]), 
      profission: infoOnArray[2], 
      state: infoOnArray[3]
    );

    return patientModel;
  }

  void _printData({
    required String data, 
    required String prefixInfo
  }) {
    print('$prefixInfo $data');
  }

  void _separatePrint() {
    print('\n------------------------\n');
  }

  final patientsData = patients.map(_getDataOnModel).toList();

  print('1 - Apresente os pacientes com mais de 20 anos e print o nome deles');
  final patientsWithAgeMajorThanTweenYears = patientsData.where(
    (patientData) => patientData.age != null && patientData.age! > 20
  ).toList();

  patientsWithAgeMajorThanTweenYears.forEach(
    (data) => _printData(data: data.name, prefixInfo: 'Paciente')
  );

  _separatePrint();

  print('2 - Apresente quantos pacientes existem para cada profissão (desenvolvedor, estudante, dentista, jornalista)');
  final patientsGroupedByProfission = patientsData.fold<List<PatientsProfissionGroupModel>>(
    <PatientsProfissionGroupModel>[], 
    (patientsProfissionGroupModel, currentPatient) {
      final associatedGroupProfissionIndex = 
        patientsProfissionGroupModel.indexWhere(
          (group) => group.profission.toLowerCase() == currentPatient.profission.toLowerCase(),
        );

      if (associatedGroupProfissionIndex >= 0) {
        patientsProfissionGroupModel[associatedGroupProfissionIndex].patients.add(currentPatient);
      }
      else {
        patientsProfissionGroupModel.add(PatientsProfissionGroupModel(
          patients: [ currentPatient ],
          profission: currentPatient.profission,
        ));
      }

      return patientsProfissionGroupModel;
    }
  );

  patientsGroupedByProfission.forEach((group) => _printData(
    data: group.patients.length.toString(), 
    prefixInfo: 'Total de pacientes para profissão ${group.profission}:'
  ));

  _separatePrint();

  print('3 - Apresente a quantidade de pacientes que moram em SP');
  final patientsThatLiveInSP = patientsData.where(
    (currentPatient) => currentPatient.state.toUpperCase() == 'SP'
  ).toList();

  _printData(
    data: patientsThatLiveInSP.length.toString(), 
    prefixInfo: 'A quantidade de pacientes que moram em SP é de'
  );
}

class PatientModel {
  PatientModel({
    required this.name,
    required this.profission,
    required this.state,
    this.age,
  });
  
  String name;
  int? age;
  String profission;
  String state;

  @override
  String toString() {
    return 'PatientModel(name: $name, profission: $profission, state: $state, age: $age)';
  }
}

class PatientsProfissionGroupModel {
  PatientsProfissionGroupModel({
    required this.patients,
    required this.profission,
  });
  
  List<PatientModel> patients;
  String profission;

  @override
  String toString() {
    return 'PatientsProfissionGroupModel(patients: $patients, profission: $profission)';
  }
}