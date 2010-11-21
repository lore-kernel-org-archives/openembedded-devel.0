Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PKGEs-0005zy-3a
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 21:10:18 +0100
Received: by qwf7 with SMTP id 7so83407qwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 12:09:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.19.207 with SMTP id c15mr3517349qab.14.1290370146329; Sun,
	21 Nov 2010 12:09:06 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.95.74 with HTTP; Sun, 21 Nov 2010 12:09:06 -0800 (PST)
X-Originating-IP: [95.29.187.131]
In-Reply-To: <4CE9332C.7020701@opendreambox.org>
References: <4CE6FA0C.2090801@balister.org> <4CE9332C.7020701@opendreambox.org>
Date: Sun, 21 Nov 2010 23:09:06 +0300
X-Google-Sender-Auth: RIInPIMCThK5e8CbTeY3OHwt6gI
Message-ID: <AANLkTi=q_cw274ureZth5YpqPHi6p_c=zrPgrP2yfnJh@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Revert commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8
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
X-List-Received-Date: Sun, 21 Nov 2010 20:10:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/21 Andreas Oberritter <obi@opendreambox.org>:

> Maybe it would be wise for bitbake or OE to set ulimit -u to a sane
> value. Is there a way for a process to count the number of its direct
> and indirect child processes?

Hm.. I'll count # of processes used while building OE with next testbuilder run.
Just for our info and for my fun :)

-- 
Yury Bushmelev


