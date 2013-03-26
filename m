Received: from mail-we0-f195.google.com ([74.125.82.195])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <1337ch1770r@googlemail.com>) id 1UKUZH-0000sV-5m
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 15:09:39 +0100
Received: by mail-we0-f195.google.com with SMTP id k14so1036867wer.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2013 06:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=5k3LyXFFALxm8t9mziVrOsEQpkQOAwHiq3a4VTKPTqg=;
	b=pC2na7tLMESYjYKI32xJsL3/qvi1mG+Qnj14HYOC8jYZUUjZfnTZV2DdIrrm4HY8Pn
	ZS2oCjpX65Cnnqtl4PDDy1gekumZdrY6ooCj0L94MZsC9N/fMKmJf9IgSU+asbb5T9f4
	D/AMNn0cg4IGaVD93Q+Ijs1YXTfMUyRfix2nVEDwea1c6DmIMTerzGJGVftPFhAGYFZa
	KN/ARiDxCznWzt/t49Bu5ZKSJJD6nPIu0nF1YzrXf1rLKDnWtFSDP+EIqSi9xu6SqpXl
	VcYxP+EMuzflhrPbR7gzWq/ZTZyRodrbzkFABordLVEhPLHsl18NFYpDHz4Z2PvHRZBj
	0/lQ==
MIME-Version: 1.0
X-Received: by 10.180.72.228 with SMTP id g4mr3389868wiv.22.1364305959761;
	Tue, 26 Mar 2013 06:52:39 -0700 (PDT)
Received: by 10.194.16.196 with HTTP; Tue, 26 Mar 2013 06:52:39 -0700 (PDT)
Date: Tue, 26 Mar 2013 14:52:39 +0100
Message-ID: <CACCbTUkq760C8oN1o5NycCJ6T+JLs5eobd28JAW6m388w___tQ@mail.gmail.com>
From: d r <1337ch1770r@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: "No recipes available"
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
X-List-Received-Date: Tue, 26 Mar 2013 14:09:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

"No recipes available for:
/media/sda1/meta-fsl-arm-master/meta-fsl-arm-master/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
/media/sda1/meta-fsl-arm-master/meta-fsl-arm-master/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bbappend

/media/sda1/meta-fsl-arm-master/meta-fsl-arm-master/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
/media/sda1/meta-fsl-arm-master/meta-fsl-arm-master/recipes-graphics/mesa/mesa_9.0.2.bbappend
"
Does anyone know what to do now?

Up to now, I have included these layers:
meta-fsl-arm-extra-master
meta-fsl-arm-master
meta-yocto-bsp

And of course
meta
meta-hob

