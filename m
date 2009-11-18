Received: from gv-out-0910.google.com ([216.239.58.190])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NAqt5-0005oO-Vb
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 21:12:27 +0100
Received: by gv-out-0910.google.com with SMTP id e6so378535gvc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 12:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=mWjOAzSyAjz0+SSGPkb33lK07vfTOJu+JNIgZ5XvU0E=;
	b=b8YKUd2S2pon9pnT5+tJelxM5zyAzkUAGgv/ca3hk8/jXUvhiRW3MzcAotVpiakG6m
	q16k1NxpsjJnRej8YlHA31ONCNjJKKEIKaVk2vc7YFZNOOj9XZipNP+YCFxYBc3EJ7H8
	WBC55jDctspZ0av34wyiIwADYHhzzkUKbaFfI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=hC2JlWcDiFgZHQC1QbZvWbnjL8yLfFcYMS+TytE3Xg4h+ZXKDWIUWhGiVgE7GYDE4k
	z7zdJENqaB2trY3l/t02odo8Wi1ElDRWSCIfHn3bj2rIyLDAXH9JWSO9zxbG7oU1C2zx
	3zEdms7dYVQ8gb5P3PWN4cBFq9JUPgk3iLvn8=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.237.193 with SMTP id k1mr1126264hbp.173.1258575061492; 
	Wed, 18 Nov 2009 12:11:01 -0800 (PST)
Date: Wed, 18 Nov 2009 18:11:01 -0200
X-Google-Sender-Auth: b6d55e7ba9716f5a
Message-ID: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 216.239.58.190
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] Merging of stable/2009 into dev
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
X-List-Received-Date: Wed, 18 Nov 2009 20:12:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I've been thinking about how difficult will be when we start stable/2010.

From my POV the best alternative is, before we start changing a lot of
stuff in dev we do a merge of stable/2009 into dev to allow easy
merging from outside "forks" made by users.

What it looks like for you?

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


