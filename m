Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lazy.gopher@googlemail.com>) id 1O8tUa-0001uK-Ap
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 13:07:18 +0200
Received: by bwz20 with SMTP id 20so1177735bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 May 2010 04:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=wvxNBrgnbEdtuYFL9l7rqrsFAhWqAn4VRhDZTBEHzGo=;
	b=xQ7vok/FQf70rgc7WrMvI9Udkq/VzoaKHRi4/cPziN8t37sBTjRh4dxi8l2keIV5+5
	suyfOJeq1wWfNTFSun1yzeffO4KnAxJ5kh4ReEZPzwpHgfSBFCReWT5tJJwWBczHHDI4
	VQM2KmY/BFO2XqNb6JlJxjt8WceSJk9wEyzWE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=XdW5Wajrcd9pvOh9wz1o1m6KqYKcGrJ+twLFCA9loacE3LWIwegw/eaCrTvaiHM3vO
	cgDFOnUuQmFjmNGx1lJJCgcvbRtVv4bUN2oMWTV/6ZDbZCeVZvCWFiQuEZ3YzIac70T/
	0e8OaJQxctdauITWc8bxyEYPW8ociOpEFCTnw=
MIME-Version: 1.0
Received: by 10.204.74.98 with SMTP id t34mr5220558bkj.154.1272884610549; Mon, 
	03 May 2010 04:03:30 -0700 (PDT)
Sender: lazy.gopher@googlemail.com
Received: by 10.204.121.206 with HTTP; Mon, 3 May 2010 04:03:30 -0700 (PDT)
Date: Mon, 3 May 2010 13:03:30 +0200
X-Google-Sender-Auth: 30b118c8429e7c0c
Message-ID: <h2o5df06e1c1005030403v1109fecbp101a20e977e9813d@mail.gmail.com>
From: Maksym Parkachov <lazy.gopher@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: lazy.gopher@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Old bb
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
X-List-Received-Date: Mon, 03 May 2010 11:07:18 -0000
Content-Type: text/plain; charset=UTF-8

Hi everyone,

I haven't touch openembedded for a while, last time it was still the
monotone times.
But I remember, maybe incorrect, that in the dev branch back then,
there was a bb for ZeroC ice library.
I assume, that this package was deleted during some cleanup,
but the strange thing is that I cannot find any commit in git log
regarding to this.
Maybe I'm just mixing things up, but I though the old commit history
was migrated to git.
Is there a way to check the old monotone tree?

Thanks,
Maksym.


