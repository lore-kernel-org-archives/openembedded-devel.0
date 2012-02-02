Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mgargela@gmail.com>) id 1Rsx79-00022q-MU
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 14:54:15 +0100
Received: by vcdn13 with SMTP id n13so1850469vcd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2012 05:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=pWG78RaWC1mHF0Y1ZNpxg485P7urbzj0mZ7fHvzI7Xg=;
	b=R4y8MpJAu+rz+ZNtMUHie4+cgTP3dGLQdKbNgpuXzQOZQ0wTz5EnKgvtCMI3bowLL2
	LBpgMTVYtmAx4gizI9TR0RTDGpsDm7qEoN5uxlvZ8xJ1ePCP5pyETF9AwwEzxjMz7v5Q
	YgAuc+g3zGVQO+ZVkbrIPEB6rkJ8NZNpyyjgk=
MIME-Version: 1.0
Received: by 10.220.140.196 with SMTP id j4mr1477802vcu.12.1328190379090; Thu,
	02 Feb 2012 05:46:19 -0800 (PST)
Sender: mgargela@gmail.com
Received: by 10.52.0.133 with HTTP; Thu, 2 Feb 2012 05:46:19 -0800 (PST)
Date: Thu, 2 Feb 2012 15:46:19 +0200
X-Google-Sender-Auth: OkTFmGsmhSi13R9GgNkkM5y2rJc
Message-ID: <CAObi9r-f6NA+ARrNqn_GGdr3eL43-B-ZszYS1y1tA12KiHURxQ@mail.gmail.com>
From: mgundes <mgcse@hotmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: preventing stripping binaries
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
X-List-Received-Date: Thu, 02 Feb 2012 13:54:15 -0000
Content-Type: text/plain; charset=UTF-8

     Hi everyone,

     I use oe-classic. I have two distro type (debug and release) and I
want to use same path for my application in release and debug distro
type. I wonder if I can tell OE not to strip binaries for specified package
in FILES_${PN}? Or can I change installation directory name instead of
".debug" when I use debug package FILES_${PN}-dbg?

     Thanks for your help, regards.

-- 
MahmutG

