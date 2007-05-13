Received: from [66.249.82.238] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HnLn6-00073W-5g
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 May 2007 23:39:44 +0200
Received: by wx-out-0506.google.com with SMTP id s14so1360417wxc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2007 14:39:41 -0700 (PDT)
Received: by 10.90.68.15 with SMTP id q15mr1432681aga.1179092381708;
	Sun, 13 May 2007 14:39:41 -0700 (PDT)
Received: by 10.90.50.5 with HTTP; Sun, 13 May 2007 14:39:41 -0700 (PDT)
Message-ID: <c384c5ea0705131439o1a2b71b8i26a16123ae1c591e@mail.gmail.com>
Date: Sun, 13 May 2007 23:39:41 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46474315.1070207@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <464613B3.8090003@dominion.kabel.utwente.nl>
	<46461B73.8070900@trolltech.com>
	<46461D72.4020206@dominion.kabel.utwente.nl>
	<46462BDD.6000302@dominion.kabel.utwente.nl>
	<c384c5ea0705130945k266d8bccw4f890d99d9997e52@mail.gmail.com>
	<46474315.1070207@dominion.kabel.utwente.nl>
Subject: Re: uclibc 0.9.29 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 13 May 2007 21:39:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

perl 5.8.8 needs:

UCLIBC_SUSV3_LEGACY=y
UCLIBC_SUSV3_LEGACY_MACROS=y


