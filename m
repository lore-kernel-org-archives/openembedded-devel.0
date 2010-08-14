Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OkCa8-0002PS-L3
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 10:59:13 +0200
Received: by gxk2 with SMTP id 2so1361134gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 01:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=fegUgfD9TgFb6j7ZK5H8cW1HH4TnAd7aWmU3zY4B3NE=;
	b=RDs/q8zswyPmoXHnvJf2c74n4Vr35mgSTiXv/ZEvNT/dyS/yJ4hEY46kp0nSVrEc8h
	uWqsWfP+DhiRDnzzZsUTw0QBLiIp8SKpv6/4wzf+SS2T4NhRqtikJl+M7PwVbJRjTQcD
	+IMEBqMFYl58PGy/bHZJ0X4BdVJfKGxzfBDWU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Nu94wHQlXPAehdltrPiCkHu0obtkT3Rxbo6Daqv1RD/udOc6wFqzurnkoXYAwpQ5tm
	0QDr+faiTov0EcXMCbvBXYCM3xe6BELoi6q2xYl6GVDi/m6zB98Pvm5cSaOzIB9MgjDK
	f6b1SAf3ymJfuqP9nF1uUNBPJYOBT8nV271J4=
MIME-Version: 1.0
Received: by 10.231.39.69 with SMTP id f5mr2880524ibe.53.1281776327113; Sat,
	14 Aug 2010 01:58:47 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Sat, 14 Aug 2010 01:58:47 -0700 (PDT)
In-Reply-To: <989A078976CDAD4CB2DC976EEF70E2A504270EAC@eu2-mail.mgc.mentorg.com>
References: <1281677993-19478-1-git-send-email-noor_ahsan@mentor.com>
	<1281686825.3858.0.camel@mattotaupa>
	<989A078976CDAD4CB2DC976EEF70E2A504270EAC@eu2-mail.mgc.mentorg.com>
Date: Sat, 14 Aug 2010 10:58:47 +0200
Message-ID: <AANLkTinZ+hV_6yzeTYouNn_B2Yg+E1ggcfwjrMXn18dS@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]Removing Legacy staging from genboot native recipe
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
X-List-Received-Date: Sat, 14 Aug 2010 08:59:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

reworked the patch a little bit, tested building and pushed.
FILEDIR is also gone

thanks for your contribution

Frans


