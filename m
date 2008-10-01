Received: from [74.125.78.144] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1Kl1uN-0005kx-3c
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Oct 2008 15:38:27 +0200
Received: by ey-out-1920.google.com with SMTP id 4so167663eyg.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2008 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type:references;
	bh=LfQEYtrmuR+WcG+c7rqpSHnvwi/MIZJhFHoJS3vqBUQ=;
	b=TVq2bFuC9klMvv1wO7i8v0rqmyCpT08u21pW6VeiA8eiaHnfa3NUwkNpxxcrFdShdi
	usvin/8/MLRomaXi0T7K3ww6scPaRwIkvi7Df0XBuJ/Ez7aS7ugzH3tA7n8Wv9HbR1tr
	wF4/09zf4wJ8QIGvyZ4lK+/b2vS1j3dbA9eM4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:references;
	b=GGhi+6VyRWN+y39nGWblpzcmJXq1mIv7NgtxDQ3KzbYccOgpuU7msPwM8FuO1Smdja
	ne5NUJLI8JRnO14F9jO0bYPOqo8h4pjocYPjiOE+nIqC+kIZTXL9lEXCq2AboHvuHBXy
	3QaC0ZsmQwe9fjd9SplWfR9GUduID6c+Ob/Dg=
Received: by 10.210.37.11 with SMTP id k11mr9667105ebk.136.1222868059465;
	Wed, 01 Oct 2008 06:34:19 -0700 (PDT)
Received: by 10.210.138.17 with HTTP; Wed, 1 Oct 2008 06:34:19 -0700 (PDT)
Message-ID: <359c5480810010634m377ab993rd030d8c0c917b8b3@mail.gmail.com>
Date: Wed, 1 Oct 2008 15:34:19 +0200
From: "Nicola Mfb" <nicola.mfb@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48E3762E.6000203@smartlink.ee>
MIME-Version: 1.0
References: <48E36C18.4090504@smartlink.ee>
	<873ajglc0d.fsf@neumann.lab.ossystems.com.br>
	<48E3762E.6000203@smartlink.ee>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: git master not updating
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
X-List-Received-Date: Wed, 01 Oct 2008 13:38:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2008/10/1 Kalev Lember <kalev@smartlink.ee>
[...]

> Well yes, but if you just do:
> git clone git://git.openembedded.net/org.openembedded.dev
>
> you'll end up on master branch, which is not updating.


Yes, the same here, i opened one of those bugs.
I'm using a semiautomated makefile environment for fso/openmoko, this use
git and not monotone, so this problem affects a lot of peoples, please fix!

Regards

    Nicola

