Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tas5n-0008EA-NO
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2012 18:58:39 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so3943914pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2012 09:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=wJSygD6aD+7XhadNzNG1X4jDysEpfD2c+EgfnJZc+z8=;
	b=FjMs94g1z7s4zMMsUdSyiDk4U5Ldw8kvKvCn1gWN7PcmFhnT8HVwUKhQRnaPOEe22U
	a7UyDZ8hWQg3e2fqcUTeB+vn2oeO9cJW8hqR2CHDJ/m71HwuSNhq/ydBAF2mHwAN6uI9
	T5eC5GO4sM++BQ3jBQLWZ9tk4FaDIZI0gby3qavutsEEIva04Tz/kT88eLbId6HO5Vfn
	FbIlkTAqZPUT2RRTi7RVOig0Rv7v41tI8omieqrIJR+HTmHFHDkxo2SD4wEgXEZM5Ahr
	3HY649vOMXjePDcLA/cRcCidO51nhytn2fKFqMp6gvqdsvGlK26s40h7LxyLsZDPzeRo
	LEDQ==
MIME-Version: 1.0
Received: by 10.66.80.194 with SMTP id t2mr9780284pax.43.1353433475256; Tue,
	20 Nov 2012 09:44:35 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 20 Nov 2012 09:44:35 -0800 (PST)
Date: Tue, 20 Nov 2012 15:44:35 -0200
X-Google-Sender-Auth: 2LzjJJ4sB4pfywAR4h4xRhAuCXY
Message-ID: <CAP9ODKq2rt8H+LPwz-7KnfiuDmfRoULcEgzHsEsB_qKgR-Ka8A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Danny branch
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
X-List-Received-Date: Tue, 20 Nov 2012 17:58:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

It is time to branch for danny as OE-Core has dropped Qt 4.8.1 thus
make Meta-OE fail to build from now on. Making this change in master
makes it work but breaks it in danny based branch.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


