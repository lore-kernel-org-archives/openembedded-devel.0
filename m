Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 43C4C76E04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 13:25:56 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so5840065qgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 06:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=iuNxX0Tk/hvRAABuY49HOO6e0F9blo8IyKNJIOfeO/A=;
	b=kNuAGa0we4w9MHUjL6PXK9/d0O/FimQOM/oiXnPl4yYA/S/AdOXNZmwBEiWn/6lCDo
	Mi/zZ4kbdZAQKLhprPN9wNuA6/dcRknrenqRlolFdKD4SpX3cfaQTdRJbZi2bJpx/LKZ
	vtUoh+VQxJHeaNDSJa1TL2uw/1ExF89cHNgi59+TAugX7Bw1EnDYpaClwrljGWC8tk63
	VOKlNMOtSilcMGCVCYcqP5QaBzDv1akLxsTQdgUMOPQ3aDA/5A3rqoMQNhuSp9MmPVVj
	vk8qP6azwsStfzaX0o5DID7Ui/Q0wLkC5oRi9Qwn0huZduiC0KGc05uffBWH+/+BIabg
	X16Q==
X-Received: by 10.140.133.198 with SMTP id 189mr57643962qhf.99.1446038756661; 
	Wed, 28 Oct 2015 06:25:56 -0700 (PDT)
Received: from localhost ([177.100.174.62]) by smtp.gmail.com with ESMTPSA id
	b35sm2234025qkb.16.2015.10.28.06.25.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Oct 2015 06:25:55 -0700 (PDT)
Message-ID: <5630cce3.231b370a.a30a1.ffffc4f2@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Wed, 28 Oct 2015 11:25:51 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Wed, 28 Oct 2015 11:25:51 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-java (master) in 2015-10-28
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
X-List-Received-Date: Wed, 28 Oct 2015 13:25:57 -0000

Hello,

I pushed following updates:

commit df20f2d68ba63e0acfb54c1947bd24a01a74f444 (HEAD -> pending, yocto/master, m/master)
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Wed Oct 28 13:38:55 2015 +0100

    README: add -M to git format-patch suggestion
    
    Add the detect renames parameter to the git-format-patch suggestion in
    the README file. This should be used for patches sent to the mailinglist.
    For more information on the parameter see "man git-format-patch"
    
    Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 53a3188b2d32520d659a5dc081f6e7e864c0106a
Author: Richard Leitner <richard.leitner@skidata.com>
Date:   Wed Oct 28 13:38:54 2015 +0100

    README: remove PREFERRED_VERSION from instructions
    
    Due to the fact that currently only one openjdk-7-jre and
    icedtea7-native version is included in meta-java, their PREFERRED_VERSION
    selections are removed from the usage instructions in the README file.
    
    Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

