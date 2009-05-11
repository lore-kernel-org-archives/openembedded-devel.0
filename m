Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1M3Qr0-0003Uj-3p
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 May 2009 10:27:18 +0200
Received: by bwz19 with SMTP id 19so2440607bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2009 01:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=K14s6TCOOunykBysdobUIXM8PBKEcLo39VT9AMU1MDk=;
	b=QaHW0C8SUjf3V5yuV4vuF5l0PDObRL/s5j+JXbvol8vURpeNR7xTCKzxnA6l6cTU1X
	OMzqffamqSGcAaUGmI5DTlxy4rwo3RY485NEs9ZvDVUkaRcvQxrtZtchs8+hIASyEkB2
	EG3gI7n1TWqFPtKZRu+XIgUlZ/VkPlqXi1owI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Qe6WmeyOIcqR+Z/NnIM8Hh5Z/qlVFBqiGy9A0+2j9z3yCe+05xLtToF5C2/9daZ1JT
	KHxufmvZ9eE29dmVb+FhiqOQK1+jijMTQF8MZaY7AD4m+So3QFyByE8mxrJeK581FSZT
	6vpsOnVf9WaMs/kPWSjy0bz3PLXkybdf+opiQ=
MIME-Version: 1.0
Received: by 10.223.105.16 with SMTP id r16mr3259779fao.24.1242030045978; Mon, 
	11 May 2009 01:20:45 -0700 (PDT)
Date: Mon, 11 May 2009 10:20:45 +0200
Message-ID: <d1b08f940905110120t2a2162a6rbc2bd7237b2df09e@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: locale_base_ar_kw
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
X-List-Received-Date: Mon, 11 May 2009 08:27:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Inspecting the .dot files I discovered in my recent builds locale base is ar_KW.
I did not know the new default locale is Arabic for Kuwait...

Not yet found out if it's angstrom-specific issue, will test.

Regards

Andrea


