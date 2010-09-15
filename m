Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OvyOV-0004iZ-Od
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 22:15:52 +0200
Received: by ewy7 with SMTP id 7so378849ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 13:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=QEthOmU0NVWdqoIo5o+y2EPwoiEnST79x7qP9R4EYcw=;
	b=Vv0pGMIc37xyD9YlBHaQF5h88eb8V7vImZd992vzv2c9LPyF+6l4IgjPIp3b2HRU9N
	L0BQ+J3X4yV4xWfHqlNVjDRK0ara5t+Fw8RmgT3nmvQvNvL4kNYPrTh3HYDh1n55z3LJ
	32KsT8cXNjph7KYtz4Nq3ior+k4lm8GxcQ5rI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=M6M0BjP4NRH6uyMvuzf7f8SnB/gEXIZ/jcw7vRuDHQroVGZQSEq/bRDvH46WWLqb1r
	ZPSZb1ezNSaznPb4F9a0tTxUFIAGHFqN20HA1Z6dFGK0MYy1YLOFyhLOibU87548PS7k
	hhUB0JujFmhDaTtUAtgFhvcklQApMgL87lHbs=
Received: by 10.223.123.14 with SMTP id n14mr897140far.106.1284581702249; Wed,
	15 Sep 2010 13:15:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.121.5 with HTTP; Wed, 15 Sep 2010 13:14:42 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Wed, 15 Sep 2010 14:14:42 -0600
Message-ID: <AANLkTikhFQU3OGHQXW7JpgzDP_CLofDNjdwfByQyptbZ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: upstart: unsatisfied recommendation for libupstart0
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
X-List-Received-Date: Wed, 15 Sep 2010 20:15:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

opkg install upstart upstart-sysvcompat

unsatisfied recommendation for libupstart0

Does anyone know what libupstart0 is? This message will be one of only three
on google that even mention it.

AJ ONeal

