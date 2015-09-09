Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 89A2E60053
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Sep 2015 13:35:18 +0000 (UTC)
Received: by qgx61 with SMTP id 61so7356351qgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Sep 2015 06:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=+OD4fe+q9k5cbp46ag4bynp7DrHMQPWqh7PGPHf5z7M=;
	b=YqFKeO0AJq0pLmS0Od3IkeC6vzre2u19Yht/BcwY7HbSVPkW3JaGAzXTF3KRqUeIKh
	BrTAR0wMGEtCfauYO3hNl8423PpOH97ZtlbkSG9dqK6aPj1JWo1tGwATuT42ewP5LHsz
	D7+HHl3mlI9EUt/qHhvJFR13uUIxdPKNazqctwg0AldA+LC5ncJMy254fvmAz30FdW4Y
	v9ZDlD3lZGra23DmyS5PXN/y2UVeWVUshJQH1eNb0VR+LV1jaYw+TeO1igyLJz4Wp1yi
	KDfOP7z4AB139qvOfqXfkzK6Y9FWX7doVCluWCWqD5xxvQIOKEQ/9T0OlHqcYnubxLb8
	KlSA==
X-Received: by 10.140.239.82 with SMTP id k79mr32333431qhc.50.1441805718831;
	Wed, 09 Sep 2015 06:35:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.84.193 with HTTP; Wed, 9 Sep 2015 06:34:59 -0700 (PDT)
From: sujith h <sujith.h@gmail.com>
Date: Wed, 9 Sep 2015 19:04:59 +0530
Message-ID: <CADyYWLmUF=-buDR654FzL6kEvyQZSXdvfsV_zAdrjCi0ToRKXA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Error with gstreamer 1.0 in qtmultimedia
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
X-List-Received-Date: Wed, 09 Sep 2015 13:35:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

When I tried to enable gstreamer 1.0 in PACKAGECONFIG of qtmultimedia
recipe and tried to build, there was compilation error in the log. Has any
one faced such an issue or tried with gstreamer 1.0? Let me know, I can
share the build errors for the same.

Thanks,
Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

