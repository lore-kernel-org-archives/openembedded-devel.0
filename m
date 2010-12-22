Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PVRFX-00082q-51
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 17:09:11 +0100
Received: by wyb40 with SMTP id 40so5283003wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 08:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=9/5p8vx8Y4l1SJLayP+aux7mVzm7Wm1fFejAhA3B7nc=;
	b=r21GNNtZQkReefxC7gqvjva63lEL3SJmhdxeQJvGm0QwTQC0zuJNnmlbqXhahekCMP
	77e0CwCSbqQybfBpMT22H5UnxvQf2hS4CNsRoS6wkXORTZJhDU8s2CG+ByxiB1EUqH+f
	j3dJMNGEPiCUaLhpvQZwgzM68ml38i2VDq6o0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=WEfiM7ZqGX44Hk0D/adVIh190knc2O3+LWeoCVqc/0zoJtv1oKH+xwAR4yiQym6emT
	GcXTiy/ONd5nZtlh66GaKv5Ip7uPK6cNhgp+8wo/yab+DMoZlnmFbLPPMJNlY+G4mWGu
	Sbz7zI4fl/7H9x2yVAcFxCZe20kH8Uy0h0oHA=
MIME-Version: 1.0
Received: by 10.216.59.143 with SMTP id s15mr2973106wec.49.1293034142706; Wed,
	22 Dec 2010 08:09:02 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Wed, 22 Dec 2010 08:09:02 -0800 (PST)
Date: Wed, 22 Dec 2010 11:09:02 -0500
Message-ID: <AANLkTik3-5x2W+DRTJ9bC0YnUQB9HbvSWEYLSMWLTPjZ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: yocto@yoctoproject.org, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Multiple Repository support
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
X-List-Received-Date: Wed, 22 Dec 2010 16:09:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I've started collecting ideas from various emails on multiple
repository support.

http://wiki.openembedded.org/index.php/MultipleRepositoryMethods

Please feel free to update the above page.

In my mind, this is a key problem we need to solve, not just for
Yocto/OE, but also for anyone doing product development.

I've personally been using git submodules for most projects, and repo
for Android based projects.

Appreciate any ideas, experiences, or insights into how we solve this problem.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


