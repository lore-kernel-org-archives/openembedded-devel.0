Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PbKws-0000dI-4l
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 23:38:18 +0100
Received: by fxm17 with SMTP id 17so16647299fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 14:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:x-user-agent:mime-version
	:content-type:content-transfer-encoding:subject:from:date:to
	:message-id; bh=qM6+Z88uzwgGbw6AvjK//XmQfNfQuHnBStA4mMYUEjk=;
	b=GZv61G2/G2MH0pDAzKfMg/nc25epseCEn/uR2waspsyuTl5MtC4jXddd5/eWWzQYIs
	gvzvy8vV5nw4xJN/yPgl7H37yW7TKPkySKnPCPRLvS3EjfPNy4QXg6gGFafS0EzuyTW7
	1FVMSO3jIVIMEF4S8nEedl55jeszsmbxVpil0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=x-user-agent:mime-version:content-type:content-transfer-encoding
	:subject:from:date:to:message-id;
	b=CRM25zo+jlz9ZH/A5taOrF8dFBelW5zU8MXJD7O/Atu2numhEVO54PH/8iwfyKgg+3
	fGhMg7QUka/8X/LR0/A2jIqnBxMAIpFUFsroCkRVfb45CBbjc8iY6Klwz6W+HLFWE0ky
	BvIzOmokJDClPSy5v0ry1gKMZorh830Nkw2j0=
Received: by 10.223.112.79 with SMTP id v15mr145348fap.143.1294439871697;
	Fri, 07 Jan 2011 14:37:51 -0800 (PST)
Received: from [10.106.42.193] ([213.162.68.20])
	by mx.google.com with ESMTPS id n26sm6296084fam.37.2011.01.07.14.37.47
	(version=SSLv3 cipher=RC4-MD5); Fri, 07 Jan 2011 14:37:51 -0800 (PST)
X-User-Agent: K-9 Mail for Android
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 07 Jan 2011 23:38:22 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <62eff391-99ba-49f7-b280-73656938bee7@email.android.com>
Subject: Possibly mistyped PN references
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
X-List-Received-Date: Fri, 07 Jan 2011 22:38:18 -0000
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi,

git grep "[^$]{PN}"
Should IMHO turn up nothing, but it does.

Hits come from recipe docs (ugh), hostap-modules-rawtx and iptables 20071127

HTH,


