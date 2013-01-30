Received: from mail-lb0-f170.google.com ([209.85.217.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <adam.yh.lee@gmail.com>) id 1U0h0m-0000At-0K
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 00:24:12 +0100
Received: by mail-lb0-f170.google.com with SMTP id ge1so2755058lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 15:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=zXXht6zk9NAS08c5O4fKfaklxhfRFkTrDDCC3x5wOeQ=;
	b=YhwIugrjoSaHY2uAH9lZ1rvpFBmgQysEKHU/lKK9P24/jed0MhZZWwKi9+SWiX+w3d
	CSaNRwguuRu2oJ5Fvrp3sVPhWhG388nqhSRAJu6fCoR2tZ/SQDp9bWXO58FDNnXrDYbR
	RMIRKqf3mTWXsUcIZaZvGIH2j/nuCJhVHSHM4UhIAOf/vS9gC1oCTOHVB90/awc0OvOR
	vnsEEWmBMJlFzJQmNQIBSOS4BTH8MxRLcAIUeuNZljCSlIO+JaVqnzXY/cOKhcOMuXxl
	n+dX8N2CdIP6vrLPaiFUA5GmGBafRm5jyDatcTZkVnoPitizFpMekxwGfxEK0u8d3w1e
	FzWQ==
MIME-Version: 1.0
X-Received: by 10.112.17.129 with SMTP id o1mr2591545lbd.54.1359587310248;
	Wed, 30 Jan 2013 15:08:30 -0800 (PST)
Received: by 10.114.76.235 with HTTP; Wed, 30 Jan 2013 15:08:30 -0800 (PST)
Date: Wed, 30 Jan 2013 15:08:30 -0800
Message-ID: <CAFeBWL4CDCgUaY_2yuMdMmYFR64WdWSyxA9BN6PKHFWOM=U+DA@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: ImageMagick recipe oudated - fetch failure
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
X-List-Received-Date: Wed, 30 Jan 2013 23:24:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi there,

I am getting no such file error when building Image Magick.
The recipe points to
ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-6.7.5-6.tar.bz2, but it
looks like the ftp server has updated file (ImageMagick-6.8.2-1.tar.bz2)
instead.

Please update the recipe :)

Regards,

Adam

