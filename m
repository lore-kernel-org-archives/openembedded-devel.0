Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 08F6775A60
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 20:53:44 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so155659261wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=QC7HTSlnrfYHJnZR7Pp5eSivdnN8mRnjRQIBBurpyDg=;
	b=YI1ZuOvZ/QocBPx4l9D2woqQPTVrwyx6rU2BesWS0xM0qpZSHYQ8sJvGrKzX+z9YMO
	qYt8B0E9sJYq6+oBjsl6kgtSqAgoEkRrXSBoZfP8O3WLcDNr9K+Vs9sabN4Mne80+j/D
	Us9C5fumlYYp6VNd1HFKgYgpwf6b0Oy+17AIAXZq8Y/2otj6pcpmPP0KY/OovG3L5Mei
	LfG3QXcZDQfx532k7zNwgVw8OJsm9TePg7LDCUWkGHR9ss86tfm45w3raYJRlPm/sv2y
	mR0Htg8iq6Ns6u4sAo3xvz3LOYf/f+zJiUvCLEFcj++G652qAs7g0DGK3DN2Av+DWOku
	eAfg==
X-Received: by 10.194.179.136 with SMTP id dg8mr56010354wjc.49.1438030424672; 
	Mon, 27 Jul 2015 13:53:44 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2DA2.dip0.t-ipconnect.de.
	[91.10.45.162]) by smtp.googlemail.com with ESMTPSA id
	k4sm15454909wix.19.2015.07.27.13.53.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 13:53:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jul 2015 22:53:30 +0200
Message-Id: <1438030411-5934-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] sorry for imagemagick mess
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
X-List-Received-Date: Mon, 27 Jul 2015 20:53:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* should apply ontop of master-next
* dropped a note so that this does not happen again when new upstrem version 
  version is available

Andreas Müller (1):
  imagemagick: update patchset from 9 to 10

 meta-oe/recipes-support/imagemagick/imagemagick_6.9.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.1.0


