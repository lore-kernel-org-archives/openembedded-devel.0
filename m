Received: from [64.233.184.235] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <cliff.brake@gmail.com>) id 1HaylH-0005f8-CE
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2007 20:38:43 +0200
Received: by wr-out-0506.google.com with SMTP id 50so903351wri
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2007 11:38:42 -0700 (PDT)
Received: by 10.115.54.1 with SMTP id g1mr2420246wak.1176143921888;
	Mon, 09 Apr 2007 11:38:41 -0700 (PDT)
Received: by 10.114.191.6 with HTTP; Mon, 9 Apr 2007 11:38:41 -0700 (PDT)
Message-ID: <f96d234e0704091138j7118f436j4f4a3cc3edee4446@mail.gmail.com>
Date: Mon, 9 Apr 2007 14:38:41 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <461A6F08.3020904@openhardware.net>
MIME-Version: 1.0
References: <4611582F.8010203@openhardware.net>
	<f96d234e0704050628p3f72ec6exe9ef8ea5c732d80b@mail.gmail.com>
	<c384c5ea0704081010y623cdbafq4f9dce1148a593e5@mail.gmail.com>
	<461972D6.1060901@openhardware.net>
	<461A6F08.3020904@openhardware.net>
Subject: Re: versioning madness
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
X-List-Received-Date: Mon, 09 Apr 2007 18:38:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/9/07, Tom Walsh <tom@openhardware.net> wrote:
> Tom Walsh wrote:
> > AH!  You know, I use svn regularly and I didn't even think about using
> > it against the OE tree!  Thanks, that would be the best solution for me.
> >
> >
> Nope, didn't work as well as I had hoped.  Both monotone and subversion
> bit^H^H^H complain about having an existing directory, so, I cannot
> "overlay" into the OE tree with either.
>
> I'll just have to do it the old-fashioned way and edit the stuff with vi.

I don't understand?  I have two trees that are completely separate
from each other:

openembedded (HEAD of OE managed with monotone)
openembedded.custom (custom stuff managed with SVN)

The beauty of this setup is the trees do not interfere with each other.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


