Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1KmVGQ-0002dw-Vq
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Oct 2008 17:11:19 +0200
Received: by nf-out-0910.google.com with SMTP id d21so1196357nfb.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Oct 2008 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type;
	bh=FBPbdUdRUN15yLZfFhkgE+VKlWAC0KPeJidN6EloL5c=;
	b=SyKgGXI9USlsMRp6vlMkj+tAiqRQDH9WsolKKXuT4YKoz6qikvX7kd+zrpC3neu37Q
	oRIwOBLUy7+YqmA1upqc0XwohV/gyMR4V5WHlcoRw47Y5KO9H/VeJAnykmRtoCl2le6f
	W+2mGIAR91AyL6zCb/m90GhCo67bTMACebD1c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type;
	b=f02X8TtKIyKn5SNcQE4QR90XMcqllPaDq7rMkfl5FqA9nFD9t9+e87vMAUCexDbLSO
	d1S9WNsuoanYRYEs2x1m2aH0XOYysoZbwkSQDuZO8kmJ5igWsg83gPxscgMVxUeRaA+B
	izv1p9LqfxRNQlNIapqAXC9+E/JTGbL1HX1Z4=
Received: by 10.210.44.1 with SMTP id r1mr4737710ebr.153.1223219213692;
	Sun, 05 Oct 2008 08:06:53 -0700 (PDT)
Received: by 10.210.138.17 with HTTP; Sun, 5 Oct 2008 08:06:53 -0700 (PDT)
Message-ID: <359c5480810050806t6e368b2fta20d1edecd165757@mail.gmail.com>
Date: Sun, 5 Oct 2008 17:06:53 +0200
From: "Nicola Mfb" <nicola.mfb@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Qt 4.4.1 and sqlite
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
X-List-Received-Date: Sun, 05 Oct 2008 15:11:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
while trying to port a custom qt/application to angstrom i noted that the qt
sqlite driver is not available.
May be it possible to have support for it?

Regards

    Nicola

