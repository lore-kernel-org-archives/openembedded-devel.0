Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SU5N3-0006nV-6R
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 02:12:09 +0200
Received: by ggnp4 with SMTP id p4so1273716ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 17:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=7CorYNe757HC8uKpMeG2VDW+64CwOvJcP5WcF96QrFY=;
	b=MbVxENtjQisHIO60AaPUHHNppEg52XrJZ+55Yz5BLyeY2NA1VAnjtiubyIOB8ci5nJ
	MDDPXxnF8kXd/fY3uw3Gp37gQ/xsgOb+OS8x6iM6eUjZTTjrl9PgapLhPmhrA5mDKeYz
	OBzFj0Axud7TBs5Z971Bjd3Q8FbbThahhGEYSVLpJY/r6VC3kcVyh5rsxMKW89Bby6Ch
	F7rHaowgHGk+6mO1KWTd7FTc/tDFgGbRaOAf3SjHqkt1YaalZ+a1chhP8DQlaZlpTf1K
	ajBvZI7WNoLCc2QUtz0w00I8HzfQH6sCnpYlgeCKhy6+aTxQNYGF86LEt8ON/Z52MaGr
	DPVA==
MIME-Version: 1.0
Received: by 10.50.94.200 with SMTP id de8mr5393239igb.21.1337040129023; Mon,
	14 May 2012 17:02:09 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Mon, 14 May 2012 17:02:08 -0700 (PDT)
Date: Tue, 15 May 2012 03:02:08 +0300
Message-ID: <CAF6bG8e9WW3S_OrP_Ad085-9XB4eBCrd9aCAh_xsrOPZ_kuisA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: meta-games layer
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
X-List-Received-Date: Tue, 15 May 2012 00:12:09 -0000
Content-Type: text/plain; charset=UTF-8

Do you maintain any kind of list of freely available recipes provided
by third parties? If I need some library for which there is no recipe
in openembedded-core or meta-openembedded, I'd like to check if
someone else has already made it and not to reinvent the Wheel myself.

I found layers list http://www.openembedded.org/wiki/LayerIndex . Is
there some criteria what layers are accepted to that list? I just
wonder if I should/could add my new project to provide basic recipes
for some open source games, called meta-games layer (
https://github.com/cazfi/meta-games ), to that list.


 - ML


