Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tbyuz-0000Py-66
	for openembedded-devel@openembedded.org; Fri, 23 Nov 2012 20:28:05 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so1437917pad.6
	for <openembedded-devel@openembedded.org>;
	Fri, 23 Nov 2012 11:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=t3lhwom2ws9VIeE0vIB2kNnoUxdAAOITnOUo5qjjMZU=;
	b=lbCSylq/YqCNybKP/08Wyf8g9FRVIebmAT52dDBblDHpz6fgCRy7wUM9ZMQRuNXJnh
	ielnWZssxtm02FisIWpr5lfwzZxnWQy7CumPLIi6zY1JFCzBz6UTx9Vx58djuxaviOLu
	CYePo72xiI/ms1R+UEY55LtEhM7l/52OuEa/rBLqkGxj86ONlFpUPFpRQnByHvGLmstA
	ttc9WGggdtDelqxy+FTBw2Cfg7zDzkcuqmjBt8qG4LQY4jK16Ns0iURXiFRpuYmUbeux
	ZIbeGRHm4k5g+KPLvMJW+Ng7qFp9tRzbNFXLGdtEBP7bpzLdCrQE2D6BH9IhtHzK/Qco
	dGkQ==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr16764847pbc.33.1353698036276;
	Fri, 23 Nov 2012 11:13:56 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Fri, 23 Nov 2012 11:13:56 -0800 (PST)
Date: Fri, 23 Nov 2012 17:13:56 -0200
X-Google-Sender-Auth: vUwVYXNy1G0dnFyYkRW4TOb00jQ
Message-ID: <CAP9ODKpUkrqyzaN-X74QfrfLS_NWXyLbuguzsa+uAfocHN2-aw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: patchwork support for meta-freescale
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
X-List-Received-Date: Fri, 23 Nov 2012 19:28:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Could patchwork support be added to meta-freescale? It'd allow for
easy handle of patches.

Thanks,

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


