Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QedeM-0003ML-Og
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 03:45:07 +0200
Received: by iym10 with SMTP id 10so502974iym.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 18:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=nSg3iEdrvgMndhkd6dHcI8FIWTrrOwA5U1xUsqGZ99w=;
	b=K4a7681TsfFhmRaaWkLtRMxTEF8LpU55fHhLCxbsre7SqxkihPqVoE8j+zq+4bLB5M
	2n0VxQJ+vd3Yy7tVI3mhRyUtoLenIMtSY7nGMP73HRZxMtRFrkHPltYO/QG27ZjS24cm
	kYil2TJOqJJlu7CkOOaeM2NpH08bq7U2k8lcA=
MIME-Version: 1.0
Received: by 10.42.172.200 with SMTP id o8mr226145icz.475.1310002874007; Wed,
	06 Jul 2011 18:41:14 -0700 (PDT)
Received: by 10.231.174.73 with HTTP; Wed, 6 Jul 2011 18:41:13 -0700 (PDT)
Date: Wed, 6 Jul 2011 20:41:13 -0500
Message-ID: <CAD=GYpZKhaBrJFFpYUSjGft6Eu6sq88YGtNPf+gjAj1bBUCwOA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joel Fernandes <agnel.joel@gmail.com>
Subject: In reply to review of [PATCH] libxml: Deleted patch that is already applied in source tarball
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jul 2011 01:45:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

Sorry I am unable to reply to your email on libxml2 as I'm a
digest-mode subscriber so I have started another thread. Could I be
kept on the CC-list by replying-to-all?

My build configuration is:
DISTRO="angstrom-2010.x"
MACHINE="beagleboard"

git branch: org.openembedded.dev

Uncompressing the sources from the downloaded archive
libxml2-2.7.8.tar.gz shows that the patch in
recipes/libxml/libxml2-2.7.8/0cbeb50ee03ce582a0c979c70d8fbf030e270c37.patch
has already been applied to xpath.c

Could your build configuration be pulling a different recipe?

Thanks,
Joel


