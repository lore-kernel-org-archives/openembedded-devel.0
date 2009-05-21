Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJN-0005ca-CD
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:13 +0200
Received: by fxm20 with SMTP id 20so805174fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:date:message-id:x-mailer;
	bh=amejSy51u+wRx65DfcEKwduYHUI/Roxwm1NAu2CMr3Q=;
	b=Kg5qJbQ4aDciHBsA4NUFLQHeFqjoyMzcSGirDAobhMWAjUYvdgpLuyYHw6LdUeFf1k
	0Wm4YERjJFjyA6rZQWzLaeTJVja7PVATWcMtOM8HinptS/VZivH6WX/QQfSJBv7ntnma
	nSdLPZfj3djI07OmPzUzugSlyMaPxGuZH9Q0c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	b=xS03TtvFp+0p1KrGi5g9RgyqRqO8GOqIl7sM39roBIHPFvXWTlotZZt++l0SXQ8gXS
	h+/aWbellZcZGyjupwBMVgZukG4RzOX4MVbtk4ai7MUfM2C7TmoxJW/3v1dgtM5SDCLs
	TT56DnPW8tdY14n81sn1k1XJ/dg2vfOL6IsnQ=
Received: by 10.103.198.15 with SMTP id a15mr1065351muq.60.1242873579483;
	Wed, 20 May 2009 19:39:39 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id s10sm129580muh.27.2009.05.20.19.39.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:38 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 1AA826103B1; Wed, 20 May 2009 23:39:41 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:15 -0300
Message-Id: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
Subject: Final sent before pushing, please ack
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
X-List-Received-Date: Thu, 21 May 2009 02:47:15 -0000

Hello,

I believe that all requested changes/fixes were done and I'd like to
push this patchset as soon as possible so some of them could be ported
to stable.

Please ack the patchset or point anything missing. I'll try to take it
into account as soon as possible and push it.

Cheers,

--
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


