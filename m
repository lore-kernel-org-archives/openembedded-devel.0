Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NeaxB-0005Iv-0K
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 22:15:36 +0100
Received: by fxm27 with SMTP id 27so1137748fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 13:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=h9Nhj/kA4448gzlljnJOHwFk2r0nCS/YAd97/cFyUJU=;
	b=aTUhHZZ5+YKU/dGVKEDq33iv4heQVOQY1NNUNGBoaT4yuIHa3qYA6GwHLTmHtepNkG
	8r1yObZRQtTGHwFaIvMP+0bRNttbZngTeXtK5LzxzxZNeJZiuW+dOiaWwxpa3NJFfe/A
	47fxxsryhHQO64Y7fjjvZ+yUheowSPoitaUPE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=aS0oHiO5Fg4EH5YuSVD34QSP6t+sZLLUL+TRRUcNJcdVf7wz4urUqsLmkydorHB38g
	0xDEKqioFJEa6dnWmEpPHmOglEdX+YBTREXlgV8B02St0RruXqVULiXjHtCKfu25DzHr
	XhpLmPaImF1/kUJQu/cV4VnxmJIh/kmdLZNGg=
Received: by 10.223.4.25 with SMTP id 25mr436574fap.38.1265663581148;
	Mon, 08 Feb 2010 13:13:01 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 1sm7251042fkt.33.2010.02.08.13.12.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 13:12:57 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NeawH-0004G3-BD; Mon, 08 Feb 2010 22:14:37 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 22:14:21 +0100
Message-Id: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 0/12] random misc trivia
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
X-List-Received-Date: Mon, 08 Feb 2010 21:15:37 -0000

Hi,

A small series of unrelated patches that i could easily isolate.
Please apply.

thanks,
Bernhard


