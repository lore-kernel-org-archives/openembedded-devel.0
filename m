Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Rzv65-0002f6-PP
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 20:09:57 +0100
Received: by wibhq7 with SMTP id hq7so3904278wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 11:01:38 -0800 (PST)
Received-SPF: pass (google.com: domain of rep.dot.nop@gmail.com designates
	10.180.14.193 as permitted sender) client-ip=10.180.14.193; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of rep.dot.nop@gmail.com
	designates 10.180.14.193 as permitted sender)
	smtp.mail=rep.dot.nop@gmail.com;
	dkim=pass header.i=rep.dot.nop@gmail.com
Received: from mr.google.com ([10.180.14.193])
	by 10.180.14.193 with SMTP id r1mr29273350wic.9.1329850898665 (num_hops
	= 1); Tue, 21 Feb 2012 11:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=IgMtOYZ4HNKgWwAkpfN/FQTnRn6xIrPkmioulN8Wbx4=;
	b=bhQX4RpU0+XGBpisuZLoeZowvsMeqGTg5/RJgWDtU5SdjuBfjSfwJOl1NXTQYMsfDA
	cAhZaYAy9ce7i1937MJ79XxrkhCqpDnN1tPw0NcqqDcftCA0wWYiNQnNAciO64LD0oer
	XW7aH9vJgfqMnl2I5IpT3l7PJEFrhxUkhPWHg=
MIME-Version: 1.0
Received: by 10.180.14.193 with SMTP id r1mr24439762wic.9.1329850898562; Tue,
	21 Feb 2012 11:01:38 -0800 (PST)
Received: by 10.216.243.203 with HTTP; Tue, 21 Feb 2012 11:01:38 -0800 (PST)
Received: by 10.216.243.203 with HTTP; Tue, 21 Feb 2012 11:01:38 -0800 (PST)
Date: Tue, 21 Feb 2012 20:01:38 +0100
Message-ID: <CAC1BbcT8wRZE_-FNAP-YAQvpU_j9ygGLWYcMnb+M8szKOFeMWQ@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: DISTRO_FEATURE pthread(s) ?
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
X-List-Received-Date: Tue, 21 Feb 2012 19:09:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

http://sourceware.org/bugzilla/show_bug.cgi?id=9657

Prompts me to question if I can command this with OE ATM?

