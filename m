Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NUimk-0001D4-1c
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 16:36:01 +0100
Received: by pzk30 with SMTP id 30so14267979pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 07:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=QcukNTwayvo9CsvpFqMm9hU2qQi+yZNMJgPfzd++kvw=;
	b=W9wgxeB10nOTdBYXJDD/lWjDObOAYKwbkVpx6e4AT3fRdO/0Pyn6xfaZmpGI97E7mX
	l9PgtSf3osNl7LkyDE8pRTlJHb0VRp7zg9IkOmY4f0K0VyB+vP2BbBmr0OCae6AeANe+
	CHa8h5NCs7HK8OzhM8aXO+CLcwsdW3bwrCgds=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=XwVhgl4vY9/JkVGN3iX8kP2k3UaaRyngcgi5K8JNHJoPVYWKV2kdXQULZ3iV9567sw
	qb4u8LgYAaDmeocuyMVl3+ZaM2F8eYg8T7mO71Kucm96+G2/W/l84sAW1md5nvCmGKPl
	/+UwPie1Y7wMZzbCyArGHKQQW88HFoWMER3jo=
MIME-Version: 1.0
Received: by 10.141.91.4 with SMTP id t4mr128978rvl.190.1263310427763; Tue, 12 
	Jan 2010 07:33:47 -0800 (PST)
In-Reply-To: <loom.20100112T154902-934@post.gmane.org>
References: <BAY127-W199A6B7DA19A55E32E8648D86C0@phx.gbl>
	<d1b08f941001120644q1a82954bhc3e867abadc9fa66@mail.gmail.com>
	<loom.20100112T154902-934@post.gmane.org>
Date: Tue, 12 Jan 2010 16:33:47 +0100
Message-ID: <d1b08f941001120733t85ff7f2vc51449fa3d7c5c6e@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbaking helloworld
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
X-List-Received-Date: Tue, 12 Jan 2010 15:36:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

> and which ipk I should extract that contains executable to be run on my platform

something like deploy/glibc/ipk/ARCH/helloworld-static-xyz.ipk ?

Andrea


