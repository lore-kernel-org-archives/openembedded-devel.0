Received: from [209.85.198.186] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rsenykoff@gmail.com>) id 1IOQgo-0002SU-9o
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2007 06:22:30 +0200
Received: by rv-out-0910.google.com with SMTP id c24so578922rvf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 21:21:14 -0700 (PDT)
Received: by 10.115.90.1 with SMTP id s1mr3021661wal.1187929273579;
	Thu, 23 Aug 2007 21:21:13 -0700 (PDT)
Received: by 10.114.66.17 with HTTP; Thu, 23 Aug 2007 21:21:13 -0700 (PDT)
Message-ID: <b7022e40708232121w53c4ec04g7df06dd2bf1e0dd5@mail.gmail.com>
Date: Fri, 24 Aug 2007 00:21:13 -0400
From: "Ron Senykoff" <rsenykoff@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: noob trying to build for i686 (PIII)
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
X-List-Received-Date: Fri, 24 Aug 2007 04:22:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi I'm new to openembedded, not linux so much though.

OK so I try to build nano, with 'bitbake nano'
Here's the output: http://paste.uni.cc/16996
And here's my local.conf: http://paste.uni.cc/16995

I hosted these to save space.

Any ideas? I'm going for a simple build for a PIII box that I need
alsa support as I'll be using it in the trunk of my car to process
audio in/out (a.k.a. www.duffroomcorrection.com)

TIA
-Ron


