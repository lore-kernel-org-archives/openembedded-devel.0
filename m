Received: from [213.160.40.50] (helo=popeye1.ggamaur.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roger@bufferoverflow.ch>) id 1JbJVE-0005By-0T
	for openembedded-devel@openembedded.org; Mon, 17 Mar 2008 18:52:06 +0100
Received: from automat.bufferoverflow.ch (c-82-192-224-61.customer.ggaweb.ch
	[82.192.224.61])
	by popeye1.ggamaur.net (8.13.7/8.13.7/Submit) with ESMTP id
	m2HHq03o032093 for <openembedded-devel@openembedded.org>;
	Mon, 17 Mar 2008 18:52:01 +0100 (CET)
	(envelope-from roger@bufferoverflow.ch)
Received: by automat.bufferoverflow.ch (Postfix, from userid 33)
	id 7C3642AD9E; Mon, 17 Mar 2008 18:51:11 +0100 (CET)
Received: from faro.bufferoverflow.ch (faro.bufferoverflow.ch [10.0.0.69])
	by www.bufferoverflow.ch (Horde MIME library) with HTTP;
	Mon, 17 Mar 2008 18:51:11 +0100
Message-ID: <20080317185111.ni7kp2a40sk0ccsg@www.bufferoverflow.ch>
X-Priority: 3 (Normal)
Date: Mon, 17 Mar 2008 18:51:11 +0100
From: Roger Meier <roger@bufferoverflow.ch>
To: openembedded-devel@openembedded.org
References: <20080314185530.bpxvumogsowc0s80@www.bufferoverflow.ch>
	<d2b9ea600803150541r2bcc01a8y800ea3da5e72641d@mail.gmail.com>
In-Reply-To: <d2b9ea600803150541r2bcc01a8y800ea3da5e72641d@mail.gmail.com>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.1.3)
X-Scanned-By: MIMEDefang 2.62 on 213.160.40.60
X-SA-Exim-Connect-IP: 213.160.40.50
X-SA-Exim-Mail-From: roger@bufferoverflow.ch
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]add missing backtrace support to arm gcc 4.1.2
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
X-List-Received-Date: Mon, 17 Mar 2008 17:52:06 -0000
Content-Type: text/plain;
	charset=UTF-8;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

just ARM! tested on machine at91sam9260ek.

greetings

roger



Quoting Esben Haabendal <esbenhaabendal@gmail.com>:

> On Fri, Mar 14, 2008 at 6:55 PM, Roger Meier <roger@bufferoverflow.ch>
> wrote:
>
>> Do you like backtrace ? =3D> that patch is for you!
>> <http://www.gnu.org/software/libtool/manual/libc/Backtraces.html>
>> get it: http://bugs.openembedded.org/show_bug.cgi?id=3D4072
>>
>
> Is this patch valid for all architectures, not just ARM?
>
> /Esben
>
>
>> greetings roger
>>
>> further information about the patch is here available:
>> <http://sources.redhat.com/ml/libc-ports/2006-06/msg00045.html>
>> <http://gcc.gnu.org/ml/gcc-patches/2006-06/msg00357.html>
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>



----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.



