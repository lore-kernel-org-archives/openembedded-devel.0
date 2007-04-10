Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HbL6y-0000bv-B7
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 20:30:37 +0200
Received: by ug-out-1314.google.com with SMTP id e2so120499ugf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2007 11:30:35 -0700 (PDT)
Received: by 10.66.216.6 with SMTP id o6mr451432ugg.1176229835775;
	Tue, 10 Apr 2007 11:30:35 -0700 (PDT)
Received: by 10.66.251.2 with HTTP; Tue, 10 Apr 2007 11:30:35 -0700 (PDT)
Message-ID: <c384c5ea0704101130y49a1eeb0gb99c34f1f2ad067@mail.gmail.com>
Date: Tue, 10 Apr 2007 20:30:35 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <evcm2e$15q$1@sea.gmane.org>
MIME-Version: 1.0
References: <evcm2e$15q$1@sea.gmane.org>
Subject: Re: OE a deterministic build system?
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
X-List-Received-Date: Tue, 10 Apr 2007 18:30:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Rolf,

On 4/9/07, Rolf Leggewie <no2spam@nospam.arcornews.de> wrote:
> Hi,
>
> I am pulling my hair out and losing faith in OE being a deterministic
> build system.

I have to second this concern, although I agree that it's probably all
host related (or timing related, such as the quilt-native issue when
multithreading bb tasks).

What I would like to see more, is that we help find these
creeping-in-dependencies from the host by building eachothers builds,
or other ways to help find the remaining details.

I am currently chasing a bug that prevents me from building a bb
target on a Gentoo system, which perfectly works on Ubuntu hosts.

Both starting with the prerequisite tools and a clean source dir etc.

Regards,

Leon


