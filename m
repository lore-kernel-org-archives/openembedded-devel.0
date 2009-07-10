Received: from [209.85.217.227] (helo=mail-gx0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MPKGm-0000XE-1C
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jul 2009 19:52:24 +0200
Received: by gxk27 with SMTP id 27so1588269gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2009 10:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kDbDswpQZaXjjP/0nBxARDGIxPwEXYamSD4x6ZhrYXc=;
	b=GsHSep/+6odo5hraZktQVs3B32ZsDsQohpUFnGvs4uYkvUa5ppzVrNat7BCsd9fpgu
	286kkob+HfsSPy7+m34x2lpYv2lCy6AQdzfHzUDd6CUoxr4gGHamAlqHrvaknRpw0aGv
	t2Y5QXslTtR2XUaGZUeoItArjH5OrwdGI9hhs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=TFh4h6nlI/SYeDmeAKyeI3BvO7Gvi7pofqqV3YVmFTFo5WbCzCvwijdD/xyQYw8bqS
	EYpR9v65ms01U3/zAp48KU2qeJiyPELcVrrTodpzBehjER7iH+33nSkgRlMOz71bCPv+
	+BGJZ6t1QT/7SOFR0lNUMBM7ftothufu24lXU=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.228.6 with SMTP id a6mr3020211anh.15.1247247559830; Fri, 
	10 Jul 2009 10:39:19 -0700 (PDT)
Date: Fri, 10 Jul 2009 14:39:19 -0300
X-Google-Sender-Auth: 285f1107702e1ef4
Message-ID: <be7a9f3d0907101039i6a58c3aeof2fc3e1f40d24dd0@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Mistakenly pushed changes without review, specially 6633c4c95a
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
X-List-Received-Date: Fri, 10 Jul 2009 17:52:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

I did a push by mistake while preparing to send the request for review
to the mailing list.

I'm sorry by this :(

I'm specially interested to know about 6633c4c95a. If people objects
on it I can revert it but I think it is not necessary to revert it if
people agrees with it.

So could people ack on it or nack? In case of nacks, I revert it later today.

Sorry again,

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


