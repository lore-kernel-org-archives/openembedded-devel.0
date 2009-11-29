Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gregoiregentil@gmail.com>) id 1NEkjZ-0004Mp-KP
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Nov 2009 15:26:44 +0100
Received: by pzk30 with SMTP id 30so1873402pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Nov 2009 06:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:subject:from:reply-to
	:to:in-reply-to:references:content-type:organization:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	bh=Zj5OkmsaP8Qo81J/AggW5kQqIqpmxakimZb+9Tu9294=;
	b=Gys72O+80WLvj9jPZKxLHqir0ln9DIGHkW1tburmIg1TwTZG2VHaMivzNZiBFpgDnV
	kEuz+ZNeTSPhdH/o65XU+diGEpTbVy2OMI4RdxpXFtuthd2rbZfj11ESlXhrpT4g77u/
	VrdD327cX47RuYnBQdECZ2gUsNK2RAVGFB7fE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:subject:from:reply-to:to:in-reply-to:references:content-type
	:organization:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=D59EpBoKZ21s+iiUdrRV96Kd47zadmOO/a26xQznl2Myj0nVVWGvVwwxHa3iwp+13B
	F0UqPUO4c8QXS4Nvmy1++/wsLcWJa92g5x62wSnWvRqMUMYSE7Lf3HF+JjYFJ2PL8alh
	/b6gpOcJR3x5EAkhSc7e5vbvrly4zIW9n/RrA=
Received: by 10.115.115.14 with SMTP id s14mr4794414wam.189.1259504707743;
	Sun, 29 Nov 2009 06:25:07 -0800 (PST)
Received: from ?116.6.23.151? ([116.6.23.151])
	by mx.google.com with ESMTPS id 20sm2274923pzk.1.2009.11.29.06.25.06
	(version=SSLv3 cipher=RC4-MD5); Sun, 29 Nov 2009 06:25:07 -0800 (PST)
Sender: Gregoire Gentil <gregoiregentil@gmail.com>
From: Gregoire Gentil <gregoire@gentil.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <mailman.3.1259492402.612.openembedded-devel@lists.openembedded.org>
References: <mailman.3.1259492402.612.openembedded-devel@lists.openembedded.org>
Organization: Gregoire Gentil
Date: Sun, 29 Nov 2009 22:25:04 +0800
Message-ID: <1259504704.24812.2.camel@gregoire-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: gregoiregentil@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Boost compilation error
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
X-List-Received-Date: Sun, 29 Nov 2009 14:26:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hello,

I get this error when building latest of boost:
http://pastebin.com/m6bb87892
I'm on Ubuntu 9.10 with gcc4.4.
The do compile is here:
http://pastebin.com/m1822da98

I didn't have such problem on Ubuntu 9.04.

Any idea if I'm doing something wrong or if the latest commit on boost
has a problem?

Thanks in advance,

Grégoire




