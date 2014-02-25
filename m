Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 093226ED65
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 17:17:03 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d49so1675078eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 09:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=/cmVHRHttD0uYZBDVTt8RHts3VWAYH4lOujSl6CaP1w=;
	b=XEnxaPJYvpmQzgjj2N8T/OutjT1cnXzcQ2rmQp6Mrl7PGm4fBqXG/O0kRsMXwzUqy6
	tvRB/npII1sxYld+DK8jBMmi4PkopKsbNx52g0U8Y3673f90F7Kqeo8Un9ahEw1SOUHg
	Cg+E/iFCSTCXEJomnCZL/mMrgpaZGyRpUE/FBDUezpXI2ToT+Y773mCkFDtIJhHTOiWR
	pFDMqWhEPYY6v6Bw16oc2S9Aea5qq2V29IIsUanzhPWOTW7vfzzKHSWG0CGncUWMouM0
	ELa/p8sbCEHA3sOt04YLGIGEVCPLUxL8QLVcJqxQ/Hm4HDGOCokgEe7dlz6hjqoGed8V
	t6ag==
X-Received: by 10.14.203.197 with SMTP id f45mr1039819eeo.90.1393348623557;
	Tue, 25 Feb 2014 09:17:03 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-124.unitymediagroup.de.
	[109.91.251.124])
	by mx.google.com with ESMTPSA id q44sm78400530eez.1.2014.02.25.09.17.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Feb 2014 09:17:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2014 18:16:53 +0100
Message-Id: <1393348614-15618-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][meta-qt5][jansa/qt5-5.2.1] qtbase.inc: set virtual/mesa and virtual/egl as dependency in PACKAGECONFIG[kms]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2014 17:17:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

should be same in master

Andreas Müller (1):
  qtbase.inc: set virtual/mesa and virtual/egl as dependency in
    PACKAGECONFIG[kms]

 recipes-qt/qt5/qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.3.1


