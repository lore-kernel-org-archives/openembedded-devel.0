Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1Ln9EP-0005VU-PE
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 11:24:09 +0100
Received: by bwz19 with SMTP id 19so895158bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2009 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=my7tR2nc1i5/0jI8BNtN2YFw2Jc9ZmSi5xTM3WlmqlU=;
	b=nBIvoDc8PQFo+Xt+if8JCPAYcCfRaHVjBTmzNi+R9j1+YojXkAkIv55ognA4KjFnoH
	ooliYu4/Mb779vmyWtESFszLoOIV9QHxyOcMF1ZxuH6+9TQuhbb102E2W0CboVc0szpY
	gaFMUXeXrJUzceNrtE4JtesXX2/9j93IEBBVI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=gZTn0UGsUFw1FcJTic5bFLNXVavqtpCBsFdTVY2LOpgfz6xsD+JY5n62BxLsBq2hdx
	LUQumy/SGYoTL4DD0UGEfggYfFEDRCjKEeOW4zAfNzREe4ftIDckio9BX49WXpASMlfW
	bU3/HHfiM0xoWahd0xN7UtjaJpIitmj513bsA=
MIME-Version: 1.0
Received: by 10.223.114.135 with SMTP id e7mr1455723faq.89.1238149341296; Fri, 
	27 Mar 2009 03:22:21 -0700 (PDT)
Date: Fri, 27 Mar 2009 11:22:21 +0100
Message-ID: <5c5e5c350903270322o7d0ded99k3a050586bfcef19a@mail.gmail.com>
From: Elena of Valhalla <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: xmms-tremor source file is no longer available
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
X-List-Received-Date: Fri, 27 Mar 2009 10:24:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The package xmms-tremor fails in the do_fetch stage because it can't
find the source tarball, is there a mirror anywhere?

googling for it does not help, nor browsing the http://pdaxrom.org/ website

this also breaks the beagleboard-demo-image, that depends on it

-- 
Elena ``of Valhalla''

email: elena.valhalla@gmail.com


