Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lamiaposta71@gmail.com>) id 1RRfRp-0005l8-3Y
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Nov 2011 08:34:49 +0100
Received: by vcbfo11 with SMTP id fo11so1557230vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 23:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=pqHjHSJ81yjt6b+Ii7CrW8FhOEOlfECt4AKEt5WLpCw=;
	b=uWr1cUQE/LYucmKAR6vp8Hwx3mqVSfwqDRZJ5IiVicNtrq+ehPBx02Vb8BTw1YSwj7
	H570RihN/h4wPontdJ45xbPtUi51zIjnPqpYEKRsOxrefGcTRDTrhpIkCKDAmNdq90kO
	7f+guM3WFKxxngNKArbok26Wn4h28dowP0TBU=
MIME-Version: 1.0
Received: by 10.224.117.74 with SMTP id p10mr2837305qaq.28.1321687701393; Fri,
	18 Nov 2011 23:28:21 -0800 (PST)
Received: by 10.229.88.195 with HTTP; Fri, 18 Nov 2011 23:28:21 -0800 (PST)
Date: Sat, 19 Nov 2011 08:28:21 +0100
Message-ID: <CAFU7RzMFc2jtHKRAHQYBykpBTAVhpEKh+01yKUZFXr6Et+LDFA@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: dm3730 question
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
X-List-Received-Date: Sat, 19 Nov 2011 07:34:49 -0000
Content-Type: text/plain; charset=UTF-8

At the moment I have a arago image running am37xx (without dsp) on my
desk with 2.6.37.
Can anybody point me the right branch for OE in order to move also
with dm3730 to 2.6.37 kernel?
The MACHINE can be either beagle-xm or dm3730-evm.
The confusion is created by the MACHINE=beagleboard that I don't know
if support dm3730 cpu.
Thx for any help,

Raffaele


