Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QwEZR-00027j-CB
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 16:36:45 +0200
Received: by bkbzu17 with SMTP id zu17so1010060bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2011 07:31:58 -0700 (PDT)
Received: by 10.204.130.19 with SMTP id q19mr2241860bks.88.1314196318515;
	Wed, 24 Aug 2011 07:31:58 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id s10sm301627bka.64.2011.08.24.07.31.57
	(version=SSLv3 cipher=OTHER); Wed, 24 Aug 2011 07:31:57 -0700 (PDT)
Message-ID: <4E550B5C.2050100@dresearch-fe.de>
Date: Wed, 24 Aug 2011 16:31:56 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E54DA89.2080105@dresearch-fe.de>
	<CAOd_LFy7_ij=gFeadkovP8EkVwM+dCksv0vcimGmQC9JQRD-DQ@mail.gmail.com>
In-Reply-To: <CAOd_LFy7_ij=gFeadkovP8EkVwM+dCksv0vcimGmQC9JQRD-DQ@mail.gmail.com>
X-Enigmail-Version: 1.3.1
Cc: Michael Lauer <mickey@vanille-media.de>
Subject: Re: upstart vs. task-proper-tools
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
X-List-Received-Date: Wed, 24 Aug 2011 14:36:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.08.2011 16:26, Cliff Brake wrote:
> On Wed, Aug 24, 2011 at 7:03 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>> We like to create an upstart based image. Therefor we use
> 
> Steffen, what are your thoughts on upstart vs systemd?  I am moving
> toward systemd for one project, but I'm interested in what others are
> choosing and why.

We're like to use systemd in the next major version of our images.

But currently we are bound to the runlevel model. We only want to use some additional upstart features.

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


