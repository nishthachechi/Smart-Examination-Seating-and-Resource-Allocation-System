(function () {
  const STORAGE_KEYS = {
    session: "examRoomAllocationSession",
    flash: "examRoomAllocationFlash",
  };

  const adminStudentRows = [
    {
      usn: "1RV22CS001",
      name: "Aarav Sharma",
      department: "Computer Science",
      semester: 6,
      courseCode: "22CS61",
      examDate: "24 Apr 2026",
      room: "A-201",
    },
    {
      usn: "1RV22CS014",
      name: "Diya Nair",
      department: "Computer Science",
      semester: 6,
      courseCode: "22CS61",
      examDate: "24 Apr 2026",
      room: "A-202",
    },
    {
      usn: "1RV22IS008",
      name: "Rohan Kulkarni",
      department: "Information Science",
      semester: 6,
      courseCode: "22IS62",
      examDate: "25 Apr 2026",
      room: "B-104",
    },
    {
      usn: "1RV22IS019",
      name: "Ananya Rao",
      department: "Information Science",
      semester: 6,
      courseCode: "22IS62",
      examDate: "25 Apr 2026",
      room: "B-105",
    },
    {
      usn: "1RV22EC005",
      name: "Neel Verma",
      department: "Electronics",
      semester: 5,
      courseCode: "22EC53",
      examDate: "26 Apr 2026",
      room: "C-301",
    },
    {
      usn: "1RV22ME011",
      name: "Sanjana Patel",
      department: "Mechanical",
      semester: 5,
      courseCode: "22ME51",
      examDate: "27 Apr 2026",
      room: "D-102",
    },
    {
      usn: "1RV22CV016",
      name: "Vikram Shetty",
      department: "Civil",
      semester: 5,
      courseCode: "22CV54",
      examDate: "27 Apr 2026",
      room: "D-104",
    },
    {
      usn: "1RV22EE009",
      name: "Ishita Reddy",
      department: "Electrical",
      semester: 5,
      courseCode: "22EE55",
      examDate: "28 Apr 2026",
      room: "C-204",
    },
  ];

  const studentProfiles = {
    "1RV22IS019": {
      usn: "1RV22IS019",
      password: "student123",
      name: "Ananya Rao",
      department: "Information Science",
      exams: [
        {
          courseCode: "22IS62",
          courseName: "Machine Learning",
          room: "B-105",
          examDate: "25 Apr 2026",
          time: "1:30 PM - 4:30 PM",
        },
        {
          courseCode: "22IS63",
          courseName: "Cloud Computing",
          room: "C-204",
          examDate: "28 Apr 2026",
          time: "9:30 AM - 12:30 PM",
        },
        {
          courseCode: "22IS64",
          courseName: "Web Technology",
          room: "A-201",
          examDate: "30 Apr 2026",
          time: "1:30 PM - 4:30 PM",
        },
      ],
    },
    "1RV22CS014": {
      usn: "1RV22CS014",
      password: "student123",
      name: "Diya Nair",
      department: "Computer Science",
      exams: [
        {
          courseCode: "22CS61",
          courseName: "Compiler Design",
          room: "A-202",
          examDate: "24 Apr 2026",
          time: "9:30 AM - 12:30 PM",
        },
        {
          courseCode: "22CS63",
          courseName: "Computer Networks",
          room: "B-204",
          examDate: "29 Apr 2026",
          time: "1:30 PM - 4:30 PM",
        },
      ],
    },
  };

  const adminTeacherRows = [
    {
      teacherId: "TCH2200101",
      name: "Dr. Meera Joshi",
      department: "Computer Science",
      phone: "98765 22110",
      examDate: "24 Apr 2026",
      room: "A-201",
      session: "Morning",
    },
    {
      teacherId: "TCH2200102",
      name: "Prof. Kiran Bhat",
      department: "Computer Science",
      phone: "98450 12231",
      examDate: "24 Apr 2026",
      room: "A-202",
      session: "Morning",
    },
    {
      teacherId: "TCH2200118",
      name: "Dr. Suma Prakash",
      department: "Information Science",
      phone: "97311 45902",
      examDate: "25 Apr 2026",
      room: "B-104",
      session: "Afternoon",
    },
    {
      teacherId: "TCH2200121",
      name: "Prof. Harish Gowda",
      department: "Information Science",
      phone: "98861 34120",
      examDate: "25 Apr 2026",
      room: "B-105",
      session: "Afternoon",
    },
    {
      teacherId: "TCH2200134",
      name: "Dr. Kavya Ramesh",
      department: "Electronics",
      phone: "97420 65310",
      examDate: "26 Apr 2026",
      room: "C-301",
      session: "Morning",
    },
    {
      teacherId: "TCH2200145",
      name: "Prof. Nitin Rao",
      department: "Mechanical",
      phone: "99807 22214",
      examDate: "27 Apr 2026",
      room: "D-102",
      session: "Morning",
    },
    {
      teacherId: "TCH2200152",
      name: "Dr. Shweta Menon",
      department: "Civil",
      phone: "97911 80550",
      examDate: "27 Apr 2026",
      room: "D-104",
      session: "Morning",
    },
    {
      teacherId: "TCH2200164",
      name: "Prof. Rahul Desai",
      department: "Electrical",
      phone: "98458 90314",
      examDate: "28 Apr 2026",
      room: "C-204",
      session: "Afternoon",
    },
  ];

  const teacherProfiles = {
    TCH2200101: {
      teacherId: "TCH2200101",
      password: "teacher123",
      name: "Dr. Meera Joshi",
      department: "Computer Science",
      duties: [
        {
          courseCode: "22CS61",
          room: "A-201",
          examDate: "24 Apr 2026",
          capacity: 60,
          session: "Morning",
        },
        {
          courseCode: "22CS63",
          room: "B-204",
          examDate: "29 Apr 2026",
          capacity: 54,
          session: "Afternoon",
        },
        {
          courseCode: "22CS64",
          room: "C-302",
          examDate: "02 May 2026",
          capacity: 56,
          session: "Morning",
        },
      ],
    },
    TCH2200118: {
      teacherId: "TCH2200118",
      password: "teacher123",
      name: "Dr. Suma Prakash",
      department: "Information Science",
      duties: [
        {
          courseCode: "22IS62",
          room: "B-104",
          examDate: "25 Apr 2026",
          capacity: 54,
          session: "Afternoon",
        },
      ],
    },
  };

  const classrooms = [
    {
      roomNo: "A-201",
      block: "Academic Block A",
      floor: 2,
      capacity: 60,
      projector: "Yes",
      examDate: "24 Apr 2026",
      status: "Allocated",
    },
    {
      roomNo: "A-202",
      block: "Academic Block A",
      floor: 2,
      capacity: 60,
      projector: "Yes",
      examDate: "24 Apr 2026",
      status: "Allocated",
    },
    {
      roomNo: "B-104",
      block: "Science Block B",
      floor: 1,
      capacity: 54,
      projector: "No",
      examDate: "25 Apr 2026",
      status: "Allocated",
    },
    {
      roomNo: "B-105",
      block: "Science Block B",
      floor: 1,
      capacity: 54,
      projector: "No",
      examDate: "25 Apr 2026",
      status: "Allocated",
    },
    {
      roomNo: "C-301",
      block: "Electronics Block C",
      floor: 3,
      capacity: 60,
      projector: "Yes",
      examDate: "26 Apr 2026",
      status: "Reserved",
    },
    {
      roomNo: "D-102",
      block: "Main Block D",
      floor: 1,
      capacity: 48,
      projector: "No",
      examDate: "27 Apr 2026",
      status: "Reserved",
    },
    {
      roomNo: "D-104",
      block: "Main Block D",
      floor: 1,
      capacity: 48,
      projector: "No",
      examDate: "27 Apr 2026",
      status: "Ready",
    },
    {
      roomNo: "C-204",
      block: "Electronics Block C",
      floor: 2,
      capacity: 56,
      projector: "Yes",
      examDate: "28 Apr 2026",
      status: "Ready",
    },
  ];

  const adminOverviewRows = [
    {
      courseCode: "22CS61",
      courseName: "Compiler Design",
      examDate: "24 Apr 2026",
      session: "9:30 AM - 12:30 PM",
      roomsUsed: "A-201, A-202",
      students: 118,
      status: "Confirmed",
    },
    {
      courseCode: "22IS62",
      courseName: "Machine Learning",
      examDate: "25 Apr 2026",
      session: "1:30 PM - 4:30 PM",
      roomsUsed: "B-104, B-105",
      students: 102,
      status: "In Progress",
    },
    {
      courseCode: "22EC53",
      courseName: "Digital Communication",
      examDate: "26 Apr 2026",
      session: "9:30 AM - 12:30 PM",
      roomsUsed: "C-301",
      students: 56,
      status: "Ready",
    },
  ];

  const seatingPlanMeta = {
    lastGenerated: "22 Apr 2026",
    status: "Ready",
  };

  const seatingPlanRows = [
    {
      planId: "SP-2401",
      examDate: "24 Apr 2026",
      session: "Morning",
      courseCode: "22CS61",
      roomNo: "A-201",
      studentsAllotted: 58,
      capacityUsed: "58 / 60",
      invigilator: "Dr. Meera Joshi",
    },
    {
      planId: "SP-2402",
      examDate: "24 Apr 2026",
      session: "Morning",
      courseCode: "22CS61",
      roomNo: "A-202",
      studentsAllotted: 60,
      capacityUsed: "60 / 60",
      invigilator: "Prof. Kiran Bhat",
    },
    {
      planId: "SP-2501",
      examDate: "25 Apr 2026",
      session: "Afternoon",
      courseCode: "22IS62",
      roomNo: "B-104",
      studentsAllotted: 50,
      capacityUsed: "50 / 54",
      invigilator: "Dr. Suma Prakash",
    },
    {
      planId: "SP-2502",
      examDate: "25 Apr 2026",
      session: "Afternoon",
      courseCode: "22IS62",
      roomNo: "B-105",
      studentsAllotted: 52,
      capacityUsed: "52 / 54",
      invigilator: "Prof. Harish Gowda",
    },
    {
      planId: "SP-2601",
      examDate: "26 Apr 2026",
      session: "Morning",
      courseCode: "22EC53",
      roomNo: "C-301",
      studentsAllotted: 56,
      capacityUsed: "56 / 60",
      invigilator: "Dr. Kavya Ramesh",
    },
    {
      planId: "SP-2701",
      examDate: "27 Apr 2026",
      session: "Morning",
      courseCode: "22ME51",
      roomNo: "D-102",
      studentsAllotted: 46,
      capacityUsed: "46 / 48",
      invigilator: "Prof. Nitin Rao",
    },
    {
      planId: "SP-2702",
      examDate: "27 Apr 2026",
      session: "Morning",
      courseCode: "22CV54",
      roomNo: "D-104",
      studentsAllotted: 44,
      capacityUsed: "44 / 48",
      invigilator: "Dr. Shweta Menon",
    },
    {
      planId: "SP-2801",
      examDate: "28 Apr 2026",
      session: "Afternoon",
      courseCode: "22EE55",
      roomNo: "C-204",
      studentsAllotted: 54,
      capacityUsed: "54 / 56",
      invigilator: "Prof. Rahul Desai",
    },
  ];

  const pageName = window.location.pathname.split("/").pop() || "login.html";

  const DEFAULT_PASSWORDS = {
    student: "student123",
    teacher: "teacher123",
    admin: "admin123",
  };

  function getSession() {
    try {
      return JSON.parse(localStorage.getItem(STORAGE_KEYS.session) || "null");
    } catch (error) {
      return null;
    }
  }

  function saveSession(session) {
    localStorage.setItem(STORAGE_KEYS.session, JSON.stringify(session));
  }

  function clearSession() {
    localStorage.removeItem(STORAGE_KEYS.session);
  }

  function setFlash(message, tone) {
    localStorage.setItem(
      STORAGE_KEYS.flash,
      JSON.stringify({ message: message, tone: tone || "success" })
    );
  }

  function consumeFlash() {
    try {
      const stored = JSON.parse(localStorage.getItem(STORAGE_KEYS.flash) || "null");
      localStorage.removeItem(STORAGE_KEYS.flash);
      return stored;
    } catch (error) {
      localStorage.removeItem(STORAGE_KEYS.flash);
      return null;
    }
  }

  function setText(id, value) {
    const element = document.getElementById(id);
    if (element) {
      element.textContent = value;
    }
  }

  function setHtml(id, value) {
    const element = document.getElementById(id);
    if (element) {
      element.innerHTML = value;
    }
  }

  function escapeHtml(value) {
    return String(value)
      .replaceAll("&", "&amp;")
      .replaceAll("<", "&lt;")
      .replaceAll(">", "&gt;")
      .replaceAll('"', "&quot;")
      .replaceAll("'", "&#39;");
  }

  function getStatusClass(status) {
    if (/confirmed|allocated/i.test(status)) {
      return "confirmed";
    }
    if (/progress|reserved/i.test(status)) {
      return "active";
    }
    return "ready";
  }

  function statusBadge(status) {
    return '<span class="status ' + getStatusClass(status) + '">' + escapeHtml(status) + "</span>";
  }

  function bindLogoutLinks() {
    document.querySelectorAll("[data-logout]").forEach(function (link) {
      link.addEventListener("click", function (event) {
        event.preventDefault();
        clearSession();
        setFlash("You have been logged out successfully.", "success");
        window.location.href = "login.html";
      });
    });
  }

  function requireSession(role) {
    const session = getSession();

    if (!session) {
      setFlash("Please log in to continue.", "error");
      window.location.replace("login.html");
      return null;
    }

    if (session.role !== role) {
      setFlash("Please log in as a " + role + " to open that page.", "error");
      window.location.replace("login.html");
      return null;
    }

    return session;
  }

  function normalizeIdentifier(value) {
    return value.trim().toUpperCase();
  }

  function isValidUserId(value) {
    return /^[A-Z0-9]{10}$/.test(normalizeIdentifier(value));
  }

  function getStudentProfile(identifier) {
    const normalized = normalizeIdentifier(identifier);

    return (
      studentProfiles[normalized] || {
        usn: normalized,
        password: DEFAULT_PASSWORDS.student,
        name: "Student User",
        department: "Computer Science",
        exams: studentProfiles["1RV22IS019"].exams,
      }
    );
  }

  function getTeacherProfile(identifier) {
    const normalized = normalizeIdentifier(identifier);

    return (
      teacherProfiles[normalized] || {
        teacherId: normalized,
        password: DEFAULT_PASSWORDS.teacher,
        name: "Faculty User",
        department: "Computer Science",
        duties: teacherProfiles["TCH2200101"].duties,
      }
    );
  }

  function showLoginMessage(message, tone) {
    const messageBox = document.getElementById("login-message");

    if (!messageBox) {
      return;
    }

    messageBox.hidden = false;
    messageBox.className = "form-message " + (tone || "error");
    messageBox.textContent = message;
  }

  function findAdminUser(identifier, password) {
    const normalized = normalizeIdentifier(identifier);

    if (!isValidUserId(normalized) || password !== DEFAULT_PASSWORDS.admin) {
      return null;
    }

    return {
      role: "admin",
      id: normalized,
      name: "Exam Cell Admin",
    };
  }

  function findStudentUser(identifier, password) {
    const normalized = normalizeIdentifier(identifier);

    if (!isValidUserId(normalized) || password !== DEFAULT_PASSWORDS.student) {
      return null;
    }

    const profile = getStudentProfile(normalized);

    return {
      role: "student",
      id: profile.usn,
      name: profile.name,
    };
  }

  function findTeacherUser(identifier, password) {
    const normalized = normalizeIdentifier(identifier);

    if (!isValidUserId(normalized) || password !== DEFAULT_PASSWORDS.teacher) {
      return null;
    }

    const profile = getTeacherProfile(normalized);

    return {
      role: "teacher",
      id: profile.teacherId,
      name: profile.name,
    };
  }

  function inferRole(identifier) {
    const normalized = normalizeIdentifier(identifier);

    if (normalized.startsWith("ADM")) {
      return { role: "admin", target: "index.html" };
    }

    if (normalized.startsWith("TCH")) {
      return { role: "teacher", target: "teachers.html" };
    }

    return { role: "student", target: "student-dashboard.html" };
  }

  function handleLogin(role, target) {
    const identifierInput = document.getElementById("usn");
    const passwordInput = document.getElementById("password");
    const identifier = identifierInput ? identifierInput.value.trim() : "";
    const password = passwordInput ? passwordInput.value.trim() : "";

    if (!identifier || !password) {
      showLoginMessage("Enter both the user ID and password before logging in.", "error");
      return;
    }

    if (!isValidUserId(identifier)) {
      showLoginMessage(
        "User ID must be exactly 10 characters and contain only letters and numbers.",
        "error"
      );
      return;
    }

    let session = null;

    if (role === "student") {
      session = findStudentUser(identifier, password);
    }

    if (role === "teacher") {
      session = findTeacherUser(identifier, password);
    }

    if (role === "admin") {
      session = findAdminUser(identifier, password);
    }

    if (!session) {
      showLoginMessage(
        "Invalid credentials for the selected role. Use the sample credentials shown below.",
        "error"
      );
      return;
    }

    saveSession(session);
    setFlash("Welcome, " + session.name + ".", "success");
    window.location.href = target;
  }

  function initLoginPage() {
    const flash = consumeFlash();

    if (flash && flash.message) {
      showLoginMessage(flash.message, flash.tone || "success");
    }

    document.querySelectorAll("[data-login-role]").forEach(function (button) {
      button.addEventListener("click", function (event) {
        event.preventDefault();
        handleLogin(button.dataset.loginRole, button.dataset.target || button.getAttribute("href"));
      });
    });

    const form = document.getElementById("login-form");

    if (form) {
      form.addEventListener("submit", function (event) {
        event.preventDefault();
        const identifierInput = document.getElementById("usn");
        const inferred = inferRole(identifierInput ? identifierInput.value : "");
        handleLogin(inferred.role, inferred.target);
      });
    }
  }

  function renderStudentDashboard() {
    const session = requireSession("student");

    if (!session) {
      return;
    }

    const profile = getStudentProfile(session.id);

    setText("student-name", profile.name);
    setText("student-usn", profile.usn);
    setText("student-department", profile.department);
    setText(
      "student-exam-count",
      profile.exams.length + (profile.exams.length === 1 ? " Upcoming Exam" : " Upcoming Exams")
    );

    setHtml(
      "student-exam-body",
      profile.exams
        .map(function (exam) {
          return (
            "<tr>" +
            "<td>" + escapeHtml(exam.courseCode) + "</td>" +
            "<td>" + escapeHtml(exam.courseName) + "</td>" +
            "<td>" + escapeHtml(exam.room) + "</td>" +
            "<td>" + escapeHtml(exam.examDate) + "</td>" +
            "<td>" + escapeHtml(exam.time) + "</td>" +
            "</tr>"
          );
        })
        .join("")
    );
  }

  function renderTeacherDashboard() {
    const session = requireSession("teacher");

    if (!session) {
      return;
    }

    const profile = getTeacherProfile(session.id);

    setText("teacher-name", profile.name);
    setText("teacher-id", profile.teacherId);
    setText("teacher-department", profile.department);
    setText(
      "teacher-duty-count",
      profile.duties.length + (profile.duties.length === 1 ? " Assigned Duty" : " Assigned Duties")
    );

    setHtml(
      "teacher-duty-body",
      profile.duties
        .map(function (duty) {
          return (
            "<tr>" +
            "<td>" + escapeHtml(duty.courseCode) + "</td>" +
            "<td>" + escapeHtml(duty.room) + "</td>" +
            "<td>" + escapeHtml(duty.examDate) + "</td>" +
            "<td>" + escapeHtml(duty.capacity) + "</td>" +
            "<td>" + escapeHtml(duty.session) + "</td>" +
            "</tr>"
          );
        })
        .join("")
    );
  }

  function renderAdminDashboard() {
    const session = requireSession("admin");

    if (!session) {
      return;
    }

    setText("metric-total-students", adminStudentRows.length);
    setText("metric-total-teachers", adminTeacherRows.length);
    setText("metric-total-classrooms", classrooms.length);
    setText("metric-total-plans", seatingPlanRows.length);
    setText("metric-plan-update", "Latest update: " + seatingPlanMeta.lastGenerated);

    setHtml(
      "admin-overview-body",
      adminOverviewRows
        .map(function (row) {
          return (
            "<tr>" +
            "<td>" + escapeHtml(row.courseCode) + "</td>" +
            "<td>" + escapeHtml(row.courseName) + "</td>" +
            "<td>" + escapeHtml(row.examDate) + "</td>" +
            "<td>" + escapeHtml(row.session) + "</td>" +
            "<td>" + escapeHtml(row.roomsUsed) + "</td>" +
            "<td>" + escapeHtml(row.students) + "</td>" +
            "<td>" + statusBadge(row.status) + "</td>" +
            "</tr>"
          );
        })
        .join("")
    );
  }

  function renderAdminStudentList() {
    const session = requireSession("admin");

    if (!session) {
      return;
    }

    setText("admin-student-count", adminStudentRows.length + " Students in Sample View");

    setHtml(
      "admin-students-body",
      adminStudentRows
        .map(function (student) {
          return (
            "<tr>" +
            "<td>" + escapeHtml(student.usn) + "</td>" +
            "<td>" + escapeHtml(student.name) + "</td>" +
            "<td>" + escapeHtml(student.department) + "</td>" +
            "<td>" + escapeHtml(student.semester) + "</td>" +
            "<td>" + escapeHtml(student.courseCode) + "</td>" +
            "<td>" + escapeHtml(student.examDate) + "</td>" +
            "<td>" + escapeHtml(student.room) + "</td>" +
            "</tr>"
          );
        })
        .join("")
    );
  }

  function renderAdminTeacherList() {
    const session = requireSession("admin");

    if (!session) {
      return;
    }

    setText("admin-teacher-count", adminTeacherRows.length + " Faculty Assigned");

    setHtml(
      "admin-teachers-body",
      adminTeacherRows
        .map(function (teacher) {
          return (
            "<tr>" +
            "<td>" + escapeHtml(teacher.teacherId) + "</td>" +
            "<td>" + escapeHtml(teacher.name) + "</td>" +
            "<td>" + escapeHtml(teacher.department) + "</td>" +
            "<td>" + escapeHtml(teacher.phone) + "</td>" +
            "<td>" + escapeHtml(teacher.examDate) + "</td>" +
            "<td>" + escapeHtml(teacher.room) + "</td>" +
            "<td>" + escapeHtml(teacher.session) + "</td>" +
            "</tr>"
          );
        })
        .join("")
    );
  }

  function renderClassroomList() {
    const session = requireSession("admin");

    if (!session) {
      return;
    }

    setText("admin-classroom-count", classrooms.length + " Active Rooms");

    setHtml(
      "admin-classrooms-body",
      classrooms
        .map(function (room) {
          return (
            "<tr>" +
            "<td>" + escapeHtml(room.roomNo) + "</td>" +
            "<td>" + escapeHtml(room.block) + "</td>" +
            "<td>" + escapeHtml(room.floor) + "</td>" +
            "<td>" + escapeHtml(room.capacity) + "</td>" +
            "<td>" + escapeHtml(room.projector) + "</td>" +
            "<td>" + escapeHtml(room.examDate) + "</td>" +
            "<td>" + statusBadge(room.status) + "</td>" +
            "</tr>"
          );
        })
        .join("")
    );
  }

  function renderSeatingPlanPage() {
    const session = requireSession("admin");

    if (!session) {
      return;
    }

    const uniqueRooms = new Set(
      seatingPlanRows.map(function (plan) {
        return plan.roomNo;
      })
    ).size;

    const uniqueInvigilators = new Set(
      seatingPlanRows.map(function (plan) {
        return plan.invigilator;
      })
    ).size;

    const totalStudents = seatingPlanRows.reduce(function (sum, plan) {
      return sum + plan.studentsAllotted;
    }, 0);

    setText("plan-room-count", uniqueRooms);
    setText("plan-student-count", totalStudents);
    setText("plan-invigilator-count", uniqueInvigilators);
    setText("plan-status-label", seatingPlanMeta.status);
    setText("plan-last-generated", "Last Generated: " + seatingPlanMeta.lastGenerated);

    setHtml(
      "admin-seating-body",
      seatingPlanRows
        .map(function (plan) {
          return (
            "<tr>" +
            "<td>" + escapeHtml(plan.planId) + "</td>" +
            "<td>" + escapeHtml(plan.examDate) + "</td>" +
            "<td>" + escapeHtml(plan.session) + "</td>" +
            "<td>" + escapeHtml(plan.courseCode) + "</td>" +
            "<td>" + escapeHtml(plan.roomNo) + "</td>" +
            "<td>" + escapeHtml(plan.studentsAllotted) + "</td>" +
            "<td>" + escapeHtml(plan.capacityUsed) + "</td>" +
            "<td>" + escapeHtml(plan.invigilator) + "</td>" +
            "</tr>"
          );
        })
        .join("")
    );
  }

  function initPage() {
    bindLogoutLinks();

    if (pageName === "login.html") {
      initLoginPage();
      return;
    }

    if (pageName === "index.html") {
      renderAdminDashboard();
      return;
    }

    if (pageName === "students.html") {
      renderAdminStudentList();
      return;
    }

    if (pageName === "teacher-list.html") {
      renderAdminTeacherList();
      return;
    }

    if (pageName === "classrooms.html") {
      renderClassroomList();
      return;
    }

    if (pageName === "seating-plan.html") {
      renderSeatingPlanPage();
      return;
    }

    if (pageName === "student-dashboard.html") {
      renderStudentDashboard();
      return;
    }

    if (pageName === "teachers.html") {
      renderTeacherDashboard();
    }
  }

  initPage();
})();
