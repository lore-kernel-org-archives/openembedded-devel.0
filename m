Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PV6x7-000689-7s
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 19:28:49 +0100
Received: by wyb40 with SMTP id 40so4298656wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 10:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=21x+22wUVKALXXQJjr2rpInpzrbuV4LKv6EhxSCd08o=;
	b=HGpJssBW5UEKWrGBh3zFQ/Yw7cYJ/kdPfLl6y5zFtEM7iXHlvgbH8JikYWCsiuYQs8
	rzwcUTdxtl5PcIPqHcXbS5thlu7vzEYhS0YPptvs+0t5W0p0MnGfyrJRDJB1IPzUR78x
	w+qFvQno3KNPtDzZSgmg2VNRCTab2wh5ElO2Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=JLLgFOZfL6WKsl4rNewO+tqyAmCO+GzXZeixmesqw+qMQt0pga0kat75fS8KiMrp9S
	Oy+Zc3n94GwXSiHiiQJz4Hoy6UeobgUAguhyNKQS+B+uu43CIptQayXhW6j0804xg8Fx
	WsHkAm5uMJE3u1xH6m7ag1k42DDBvebqK/ICk=
MIME-Version: 1.0
Received: by 10.216.142.101 with SMTP id h79mr6562885wej.49.1292956121246;
	Tue, 21 Dec 2010 10:28:41 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Tue, 21 Dec 2010 10:28:41 -0800 (PST)
Date: Tue, 21 Dec 2010 13:28:41 -0500
Message-ID: <AANLkTik7jg=J8LEDcxtkTnsaH-oHhvV5ciPmsEqZBfL2@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: git repo offline for gitolite upgrade
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
X-List-Received-Date: Tue, 21 Dec 2010 18:28:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I plan to take the OE git server offline in about 30 minutes for a
gitosis->gitolite upgrade.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


