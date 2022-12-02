import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import 'cource.dart';

class Cources with ChangeNotifier {
  final List<Cource> _cources = [
    Cource(
      id: '01',
      title: 'AQUATIC RESOURCES MANAGEMENT',
      description:
          'Aquaculture is defined as the production of aquatic plants and animals for human consumption. Under the pressure of the increasing world population on the one side and the stagnating or even declining fishery landings on the other side, aquaculture is considered as the only option to respond to the growing demand for healthy and sustainable seafood. Therefore, aquaculture expanded from an artisanal, extensive mode of production of aquatic organisms to a rapidly evolving bio-industry. The commercial aquaculture is a relatively young, diverse and dynamic industry with growth figures exceeding any other traditional primary production sector.',
      qualifiation:
          'GCE (A/L) Science (Bio), Bio Science Technology, Arts with Credit Pass for Soft Technology (Bio Resource Technology)',
      imageUrl:
          'https://media.istockphoto.com/photos/underwater-scuba-diver-explore-and-enjoy-coral-reef-sea-life-picture-id498283106?b=1&k=20&m=498283106&s=170667a&w=0&h=vroEmC2hFoTldjzS9avb-2mxTPIjYvUHI-iQC6YQgsI=',
      syllabusUrl:
          'https://drive.google.com/file/d/1d1Cfh5XyO0KmoYkx3Bo9wWEZeZbajp7C/view?usp=sharing',
      duration: '6 month',
      courceFee: 125000,
    ),
    Cource(
      id: '02',
      title: 'BUILDING SERVICES TECHNOLOGY',
      description:
          'Building Services Technology is a technology which is essential to day today life style for the community. Dedication to offer services relevant to the buildings in quality and up to the standards, should appreciate highly for the roles of the engineers and technologists. Building services engineers work closely with other construction professionals such as architects, structural engineers and quantity surveyors.',
      qualifiation:
          'GCE A/L 03 Pass in Relevant Stream (Mathematics, Science or Engineering Technology)',
      imageUrl:
          'https://images.unsplash.com/photo-1541888946425-d81bb19240f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZW5naW5lcmluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      syllabusUrl:
          'https://drive.google.com/file/d/1eQLdCe9H6dtx3Kz6tbDyrpHDSwbsaD6l/view?usp=sharing',
      duration: '10 month',
      courceFee: 150000,
    ),
    Cource(
      id: '03',
      title: 'ELECTRONIC TECHNOLOGY',
      description:
          'This qualification is for persons working or planning to work in the field of Electronic Technology sector. Persons with this qualification should have sound practical and theoretical knowledge and competencies to perform work at supervisory and managerial level with a career path from middle managers to higher managers in the Electronic Technology sector and eventually lead them for obtaining degree level qualifications.',
      qualifiation:
          'Candidates who have passed G.C.E (A/L) in general education system (In the field of Science (Maths) Stream or Engineering Technology Stream)',
      imageUrl:
          'https://images.unsplash.com/photo-1555664424-778a1e5e1b48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZWxlY3Ryb25pY3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      syllabusUrl:
          'https://drive.google.com/file/d/1uo6CX8AOz6Im5ZLEb9wYOoYCCBAEUh-K/view?usp=sharing',
      duration: '10 month',
      courceFee: 150000,
    ),
    Cource(
      id: '04',
      title: 'ELECTRICAL TECHNOLOGY',
      description:
          'The Electrical Technology program is intended to provide students with the opportunity to begin a career in the electrical technology occupation. The courses will provide the students with exposure to residential, commercial and industrial electrical techniques and practices. This exposure will provide them with the versatile job skills to build upon and flex during changing economic conditions.',
      qualifiation:
          'G.C.E A/L Science (Mathematics or Biology stream)/G.C.E A/L Engineering Technology/ G.C.A A/L Art with Credit passes for Hard Technology (Electrical, Electronic and Information Technology)',
      imageUrl:
          'https://images.unsplash.com/photo-1563068261-13ebbdf16aa3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZWxlY3RyaWNhbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      syllabusUrl:
          'https://drive.google.com/file/d/1shMj45TEFZVsIlAhyHN-Yn71yuv34ID6/view?usp=sharing',
      duration: '10 month',
      courceFee: 150000,
    ),
    Cource(
      id: '05',
      title: 'HOSPITALITY MANAGEMENT',
      description:
          'Sri Lanka is one of the reputed tourist destinations for its remarkable natural tourism resources and authentic food culture. As per industrial data, Sri Lankan hotels will need over 100,000 new workers with the number of star-class rooms expected to more than double in the next three years, given the new projects approved. Hospitality and Tourism industry is booming up in the Island as a result of the enormous flow of inward tourists that we continue to experience. At the same time, a considerable amount of hotel projects are in pipeline.',
      qualifiation:
          'GCE (A/L) Science (Bio), Bio Science Technology, Arts with Credit Pass for Soft Technology',
      imageUrl:
          'https://media.istockphoto.com/photos/portrait-of-luxury-hotel-staff-facing-camera-smiling-lead-by-hotel-picture-id1164197131?b=1&k=20&m=1164197131&s=170667a&w=0&h=ZAPlUOkH4ydKhrelWwrTCwTi0dMbVdSWpTkAOmA0ukU=',
      syllabusUrl:
          'https://drive.google.com/file/d/1jLs5WzErBqQwxK-007yst0lXdAPys9S8/view?usp=sharing',
      duration: '6 month',
      courceFee: 100000,
    ),
    Cource(
      id: '06',
      title: 'POST-HARVEST TECHNOLOGY',
      description:
          'Post-harvest technologies constitute an inter-disciplinary science and techniques applied to agricultural commodities after harvest for the purpose of preservation, conservation, quality control/enhancement, processing, packaging, storage, distribution, marketing, and utilization to meet the food and nutritional requirements of consumers in relation to their needs.',
      qualifiation:
          'GCE (A/L) Science (Bio), Bio Science Technology, Arts with Credit Pass for Soft Technology (Bio Resource Technology)',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1663091581455-5d6002274746?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8ZmFybWluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      syllabusUrl:
          'https://drive.google.com/file/d/1a9FZR4Wev4-RtOTo7PR0EMWHX-b_tSZ-/view?usp=sharing',
      duration: '6 month',
      courceFee: 125000,
    ),
    Cource(
      id: '07',
      title: 'QUANTITY SURVEYING',
      description:
          'Quantity surveying is a one year program oriented towards the skills required by the industry at middle management levels and leads students to the degree of Bachelor of Technology (B.Tech) in Quantity surveying. In order to achieve this, the students shall work closely with cost controlling concepts, and how to handle the resources; men, machine, material, methods and money in the construction industry. Quantity surveyor is the person who is responsible for estimating the quantities from the design drawings, and measurement of the quantities in the site during the project implementation, and preparing the current and final payments.',
      qualifiation:
          'GCE A/L 03 Pass in Relevant Stream (Mathematics, Science or Engineering Technology)',
      imageUrl:
          'https://media.istockphoto.com/photos/land-surveyor-picture-id1422602823?b=1&k=20&m=1422602823&s=170667a&w=0&h=EUmxOBwgZS4ObO2AIZgG1gNmhN83HqFGBXoAbvRHU38=',
      syllabusUrl:
          'https://drive.google.com/file/d/1TmNTZqUpL3F_LKaYO-3hpRtT-on7nf4l/view?usp=sharing',
      duration: 'One year',
      courceFee: 200000,
    ),
    Cource(
      id: '08',
      title: 'TRAVEL & TOUR MANAGEMENT',
      description:
          'With the concept of “Knowledge Economy” percolating into virtually every sector of the economy, an in-depth knowledge in Travel and Tourism, and their management is likely to provide you with an added advantage in the modern competitive career market. Travel & Tour Management offered by the Smart Student Academy seeks to provide a sound theoretical, practical knowledge and comprehensive training in the field. The goal of the Diploma is to provide job oriented   theoretical and practical training for the applicants and pave the way to go beyond a university degree after the completion of the Diploma.',
      qualifiation:
          'successfully completed the G.C.E.(A/L) examination with minimum 3 S pass in any stream with Minimum S pass in G.C.E(O/L) English',
      imageUrl:
          'https://images.unsplash.com/photo-1530789253388-582c481c54b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fHRyYXZlbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      syllabusUrl:
          'https://drive.google.com/file/d/1GFdzC2RIG9vAgFdnwoqQcffVZN9QgASd/view?usp=sharing',
      duration: '6 month',
      courceFee: 100000,
    )
  ];

  List<Cource> get cources {
    return [..._cources];
  }

  void addCource(Cource cource) {
    _cources.add(cource);
    notifyListeners();
  }

  void removeCource(Cource cource) {
    _cources.clear();
    notifyListeners();
  }

  Cource findById(String id) {
    return _cources.firstWhere((cource) => cource.id == id);
  }

  //--------------for upload dp------------------
  final ImagePicker _picker = ImagePicker();
  File _image = File("");
  File get getImage => _image;

  Future<void> slectImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        _image = File(pickedFile.path);
        notifyListeners();
      } else {
        Logger().e('No Image Selected');
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  
}
