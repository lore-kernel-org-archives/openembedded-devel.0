Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1RLbM0-0006j2-To for openembedded-devel@lists.openembedded.org;
	Wed, 02 Nov 2011 14:59:45 +0100
Received: by wwf27 with SMTP id 27so3913056wwf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Nov 2011 06:53:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.202.143 with SMTP id fe15mr5754374wbb.25.1320242017139;
	Wed, 02 Nov 2011 06:53:37 -0700 (PDT)
Received: by 10.227.200.14 with HTTP; Wed, 2 Nov 2011 06:53:37 -0700 (PDT)
Date: Wed, 2 Nov 2011 08:53:37 -0500
Message-ID: <CALJpqJxdR20T1zAYrx0B4Q+87jJ83ArwjLZMqLus+DF+dHbFiw@mail.gmail.com>
From: David Thomas <david.thomas@microbee-systems.com>
To: openembedded-devel@lists.openembedded.org
Subject: Insanity
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
X-List-Received-Date: Wed, 02 Nov 2011 13:59:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am new to OE and trying to get this tool chain working has about
finished me off. After struggling with distro issues for 2 weeks I
installed Ubuntu 10... and now
the tools at least seem to work. I am using a OMAP board from
Compulabs and the stable kernel they offer on their website. This is
for a hi-rel application.

However after gating all this way I am now stopped at
HANDHELDS_CVS=cvs://anoncvs:anoncvs@cvs.handhelds.org/cvs as it
appears this is no longer available?

update.rc seems to be the hangup. Does it really need to be this
difficult? I am at the point of tossing in the towel and moving in to
some other platform. There are no mirrors?
This is a nightmare and as usual, no solutions seem to be available.



-- 
Dave Thomas
MicroBee Systems, Inc
1429 Weatherly Road, Suite G
Huntsville, AL 35803-1187
256-489-6671 (Voice)
256-426-2431 (Mobile)
256-489-6673 (FAX)
www.microbee-systems.com
"Innovative Solutions for an Embedded World"

This message is intended for the sole use of the addressee, and may
contain information that is privileged, confidential and exempt from
disclosure under applicable law. If you are not the addressee you are
hereby notified that you may not use, copy, disclose, or distribute to
anyone the message or any information contained in the message. If you
have received this message in error, please immediately advise the
sender by reply email and delete this message.


