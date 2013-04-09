Received: from mail-vb0-f54.google.com ([209.85.212.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hirst689@gmail.com>) id 1UPVsj-0001ca-Oj
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 12:34:31 +0200
Received: by mail-vb0-f54.google.com with SMTP id w16so4591009vbf.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2013 03:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=qnaZ5P1arSGxqTw6FTMoN1aCBvEYF7371e8GZ1LXKqQ=;
	b=WVn/uB3+AaBa4FMmGvQhLSB3B6HfFrb8fctMtCBExGTHdNIY3nQjs584GiVZKO4Qer
	6BtHZgQTGeBnBcaguTJmlWh2W8EZV88K5gs9V2No8R+hWBMUob6KBdeM9SpBsSz1kFCF
	3KRhb2AM2kBIkIsMJ/th//oy3S5PYseaATu2cXlTutwrH80YR3Y1DIrCkc5EArPVykq0
	xRMyI0oKOTyGmPVXs1Ilk6QeTq62MRrLHiblhSPtHuhrLwjDSVDfD/fgcZLUVpEpKxeT
	0D8b8nuSNf86xXstjZHej/egXuGT82QCFiV3gjxMA2ro7O7oEc/thA4t9Z17c4KEFqTW
	RazA==
MIME-Version: 1.0
X-Received: by 10.220.221.210 with SMTP id id18mr18527947vcb.74.1365502629595; 
	Tue, 09 Apr 2013 03:17:09 -0700 (PDT)
Received: by 10.59.11.37 with HTTP; Tue, 9 Apr 2013 03:17:09 -0700 (PDT)
Date: Tue, 9 Apr 2013 06:17:09 -0400
Message-ID: <CAHu+ux1UCAyaf02tKgUSHAsV81p75bhP8Lo_brYqqkgasbjjag@mail.gmail.com>
From: David Hirst <hirst689@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Archiving my OE enviromnet
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
X-List-Received-Date: Tue, 09 Apr 2013 10:34:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am trying to achive (svn or tar ball) my whole oe_layersetup directory
structure.
However I seem to have problems when I check it out or untar it on a
different machine.
It does not seems to build correctly. I set up the paths to the build tools
and use /conf/setenv
to set up other paths.
It seems impossible to build everything correctly without going through a
comlete installation of the oe-layersetup form the git clone and setup
script. Does anyone have experiance with this? and have some advice?
Thanks

-- 
David Hirst
hirst689@gmail.com

