Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lloydchang@gmail.com>) id 1SSEBJ-00080X-4w
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2012 23:12:21 +0200
Received: by werb13 with SMTP id b13so569232wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2012 14:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Zad98AHjj4vLCo3bVQ+zCRoL0hh0eDB07hrXtn44F4Y=;
	b=FOOjWsQtYXKAYJKZhIqurYhwfN3UU2ihpI38W14L6L7IPSycAyrQ/PM2183I9Q64B8
	fgTLnntewaE7ipWsH+o2xSk58qSGF/eAHuiYcNOfHMfThuECr8UIUoAk0bWYgtQdGqZa
	vzznUBbBXSG8vieZbjpriQv4iMZCpJ4MDnjlZIlUeONi5fbromujw8j99yZUAszWxyXj
	/D9A2CLSU8mdfWv4cCAQbyaTOgmwpZ/WpQfdzjybZS+4WxSZ8qku2mSoMlVXu9PeNQjV
	qWBcga7qFI87w8ktzR1YZXEFj5O0kd1XckiJ8EhcgIGZ97WNhC/d5gtU+d9bJVAApnOM
	fupg==
MIME-Version: 1.0
Received: by 10.216.137.232 with SMTP id y82mr828938wei.82.1336597348116; Wed,
	09 May 2012 14:02:28 -0700 (PDT)
Received: by 10.180.106.133 with HTTP; Wed, 9 May 2012 14:02:28 -0700 (PDT)
Date: Wed, 9 May 2012 14:02:28 -0700
Message-ID: <CAKbR+sx-4vD69rHekVvwbDeVT5=0-Ouk0AmS6G_3JzZg_Hqa-A@mail.gmail.com>
From: Lloyd Chang <lloydchang@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: oe-made-easy and Getting Started
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
X-List-Received-Date: Wed, 09 May 2012 21:12:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello fellow openembedded-devel members!


I'm sharing because you may find this useful -- especially newcomers
to our OE-Core.  In my personal efforts in condensing our Getting
Started documentation succinctly, I codified it into one line:


    git clone git://github.com/lloydchang/oe-made-easy.git;
./oe-made-easy/core-image-minimal


User interface design wise, my intent of this one liner is to allow
everyone getting started to easily bootstrap core-image-minimal onto
various computers (before diving into details).  If our community
consensus finds oe-made-easy useful, please let me know and I'll start
updating our openembedded.org wiki pages to reference this one liner
or equivalent.


And if you personally find oe-made-easy useful, feel free to test it
further, fork it and/or send me pull requests via
https://github.com/lloydchang/oe-made-easy

(for now, oe-made-easy is defaulting to qemux86_64, qemux86 and qemuarm targets)


Your feedback is greatly appreciated!


Thanks :-)

Lloyd

