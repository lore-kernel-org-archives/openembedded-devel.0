Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.707.1588567350158606085
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 May 2020 21:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M5sNouE4;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id e6so3177284pjt.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 May 2020 21:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=bjCS4zVzwIj+/Up+wVApzOqoxG7rnu9YHGa06h6xdGA=;
        b=M5sNouE4ZGdo1hNfUalO2rDeMiMU2bc3v6VLSRAZ7SmmhtWhWBQ/OELEi9YGz+PfUs
         uylHkbKp4HD89rZPpgv5ZjaI6YJiF9A+7FzGAusrx7XjU6fkufqHJ7Ahhj9KSAYURYoa
         uEJ1Lew+Mvk/42NU/kPLHoLNct6EFvuAduguCOlg2q9aLgrxYg96ZJ7p8HhgE6MuiTJu
         R6DqO0p9LwCzckABTXunbPc6w8CLt7k49/VZao92vDXGZWMqQSgtUpuKAcz2bb/hdxOA
         mr7gteBP506yvCa9TQI8JmYJdaSFizJ2TvlbO0IEvadfIXbgaBxLucQScdnuQbqxUQGa
         uaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=bjCS4zVzwIj+/Up+wVApzOqoxG7rnu9YHGa06h6xdGA=;
        b=mHa1BDcdMkpPadC4aRmdrYqvuj6mYYOOGEMi8zlVUIhqYPK0GOqar1Rw9J8wtjuQL2
         VX4OpQDOeV8GXHbYPnA+chQawICSePvLP1CXDPYHJxhyi0m+9pFf46pfN/qCCe+tO0wR
         7lcNaRy3BqqK8lsbABmfLjN+ivOkScLG4hKgjqu+7c8V7PNJ5wQL29dFLa1zkevxZXsz
         cA9k/SNKYiwDSo4paogYWiG0HUFPlp5r4E0+rKLXtK7DSLDyh1WFjb0F4h7KIZy1AFQj
         z97ymmmhSxHT+hPdxRiWoAxWkEsvCGeCWC4gTeOK3Zj5eVA8jgiiLdPQ61aqmd71+Upd
         okwA==
X-Gm-Message-State: AGi0PubBnJd/wxqJIFUg4izLZQIIkCLb1mrwcaS5FV9VXKT7Eao5P0cV
	s9XLz1U5p3VgQ7cbf/6DtugIgCfv
X-Google-Smtp-Source: APiQypL2X5ubXq+rILEyXLuX7+zdvda2UQlAAzPrhQckZOMqefSP5kVBl6jz4hiAPif16e7in4vpUA==
X-Received: by 2002:a17:90a:2943:: with SMTP id x3mr14794562pjf.63.1588567349429;
        Sun, 03 May 2020 21:42:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:d8cc:ac72:24b0:3118])
        by smtp.gmail.com with ESMTPSA id w125sm6859273pgw.22.2020.05.03.21.42.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 21:42:28 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell][PATCH 0/1] Submit branch Maintainer update
Date: Sun,  3 May 2020 21:42:26 -0700
Message-Id: <20200504044227.6314-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Just throwing my hat in as normal with changes.

Armin Kuster (1):
  README: updated Maintainers list for Dunfell

 README                      |  2 +-
 meta-filesystems/README     | 10 +++++-----
 meta-gnome/README           | 10 +++++-----
 meta-initramfs/README       |  8 ++++----
 meta-multimedia/README      | 10 +++++-----
 meta-networking/MAINTAINERS | 32 +++-----------------------------
 meta-networking/README      |  6 +++---
 meta-oe/README              |  8 ++++----
 meta-perl/README            | 10 ++++------
 meta-python/README          | 12 +++++-------
 meta-webserver/README       |  8 ++++----
 meta-xfce/README            | 10 +++++-----
 12 files changed, 48 insertions(+), 78 deletions(-)

-- 
2.17.1

