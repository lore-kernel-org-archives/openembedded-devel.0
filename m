Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JJpFW-0004zY-A2
	for openembedded-devel@openembedded.org; Tue, 29 Jan 2008 13:07:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0TC7fTO027795
	for <openembedded-devel@openembedded.org>; Tue, 29 Jan 2008 12:07:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27660-04 for <openembedded-devel@openembedded.org>;
	Tue, 29 Jan 2008 12:07:37 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0TC7WkH027789
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 29 Jan 2008 12:07:32 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080129111521.7f3c76de@widy.localdomain>
References: <E1JJdLv-000623-Uv@linuxtogo.org>
	<20080129110934.3c3441da@widy.localdomain>
	<20080129111521.7f3c76de@widy.localdomain>
Date: Tue, 29 Jan 2008 12:07:32 +0000
Message-Id: <1201608452.5017.52.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev gcc-native-3.4.4: Add PROVIDES	gcc-native3
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
X-List-Received-Date: Tue, 29 Jan 2008 12:07:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-01-29 at 11:15 +0200, Paul Sokolovsky wrote:
> On Tue, 29 Jan 2008 11:09:34 +0200
> Paul Sokolovsky <pmiscml@gmail.com> wrote:
> 
> > On Tue, 29 Jan 2008 00:25:23 +0100
> > "rpurdie commit" <openembedded-commits@lists.openembedded.org> wrote:
> > 
> > > gcc-native-3.4.4: Add PROVIDES gcc-native3
> > 
> > gcc-native3?? How's that? ;-) Did you mean gcc3-native?
> > 
> > P.S.
> > There're 0 occurrences of -native[0-9] pattern in the tree, but
> > [0-9]-native gives bunch of hits like glib-2.0-native, libxml2-native,
> > qmake2-native, uicmoc4-native, etc.
> 
> Aha, we have gcc-native.inc with:
> 
> PROVIDES = "gcc-native-${PV}" 
> 
> The worse then. And that's a bit different, still.

To be honest I'm more worried about getting the functionality right and
getting rid of the gcc 3.x barrier to entry once and for all.

If you want to do a s/gcc-native3/gcc3-native/, please feel free.

Cheers,

Richard




