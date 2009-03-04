Received: from [217.146.130.193] (helo=chlothar.bnv-bamberg.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1LesWb-0006oM-Ee
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 15:56:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bnv-bamberg.de; s=mail2008; h=Subject:From:To:Content-Type:
	Date:Message-Id:Mime-Version:Content-Transfer-Encoding; bh=a9eGp
	WT2HfjTgnUklRCQ9GQ7652uoKnMpvYl3vlAAbQ=; b=Vs/jcX/gEO68IDee1QKAr
	qpyfLTzRJ3+8DvQClE71egq8ks3YrtuXZa6sfIh4DFWXx4Q7YpQK9qhlFRi4IwvO
	X+leGHVFYh3qkrUAMenaePZVcapvetRyppHuRkl4hYYjIF1onOBhzbDx5dnKT82m
	oCPXAp2dSIHT/D5t0RqhK0=
Received: from localhost ([127.0.0.1] helo=chlothar.bnv-bamberg.de)
	by chlothar.bnv-bamberg.de with esmtp id 1LesSY-0002sz-20 
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 15:52:34 +0100
Received: from w0659.w.pppool.de ([89.58.6.89] helo=[192.168.2.3])
	by chlothar.bnv-bamberg.de with esmtpa (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1LesSX-0002qi-Oe
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 15:52:34 +0100
From: harald <ba0547@bnv-bamberg.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 04 Mar 2009 15:52:30 +0100
Message-Id: <1236178350.4249.5.camel@debian.dorg.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Compile OE on Sun Ultrasparc 64 architecture?
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
X-List-Received-Date: Wed, 04 Mar 2009 14:56:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

tried to compile OE on my Sun Ultrasparc 64 machine running on debian
lenny. 
Compilation fails, package qemu-native fails to compile with an error in
zlib. please see build logs, machine h4000, user ba0547.

i have changed a value for architecture from sparc-linux to
sparc64-linux becuase sparc64-linux has not been found and cmpilation
does not even start.

please tell me what to do to resolve these errors.

Regards, harald.



