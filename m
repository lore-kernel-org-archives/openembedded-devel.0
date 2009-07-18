Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MSIFc-0003ls-7M
	for openembedded-devel@openembedded.org; Sun, 19 Jul 2009 00:19:28 +0200
Received: by an-out-0708.google.com with SMTP id c37so701977anc.30
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Jul 2009 15:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=ljBRd6lC9Dj1WRh3Ul/0uDbbzVhPK9Z8iXYkSUpYBaQ=;
	b=kMbfEc/4gnbJLaLjc2tOGzxbqh+hxYW6JBxjrcghxBkCkK04sL0ldO6NSWDxnj+Foc
	Y16u+SBNXC3xwrTyqB0xmwEKV+5WAvLTnN8swrRPuWid7DuX7pYSEqWm0rUqVckeC2tJ
	3PPTmbHZEDlNlRhw0ROGanreSIuElV8RnFIMY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=qLucmEZvwV4XDh41MvAs9vKxeI5ZC9JHLtj3KdlYmrBH/DqbxERpoVdtyuYqPP+Xlo
	5EbAqp+Y0rr99AI0fhwGwcCq1JNsj2Bd5twVEk5xS8kVayWG5RTjUJj5uA4kII0KT9qM
	6Rmcc9dQVARHJUpa9LH0z0YuUhvdlIpawY40g=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.201.7 with SMTP id y7mr736790anf.121.1247954741092; Sat, 
	18 Jul 2009 15:05:41 -0700 (PDT)
In-Reply-To: <1247614105.8747.2.camel@port4>
References: <1247612892-19937-1-git-send-email-GNUtoo@no-log.org>
	<1247614105.8747.2.camel@port4>
Date: Sat, 18 Jul 2009 19:05:41 -0300
X-Google-Sender-Auth: 4491355eea6c78ae
Message-ID: <be7a9f3d0907181505u43ce732ak10f75d5bb5518e99@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] mdev: mdev.sh: permit serial console login and correct init runlevel
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
X-List-Received-Date: Sat, 18 Jul 2009 22:19:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

I think you missed the new busybox packages that also provides mdev
no? IMO it ought to kept in sync.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


