Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LjfSF-0008AU-R9
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 21:00:08 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGO0069Q26DS4E0@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	17 Mar 2009 14:59:02 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 624606B83A8; Tue,
	17 Mar 2009 15:59:01 -0400 (EDT)
Date: Tue, 17 Mar 2009 15:59:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <871vswlybr.fsf@neumann.lab.ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090317195901.GC15734@denix.org>
MIME-version: 1.0
References: <1237246365-32076-1-git-send-email-denis@denix.org>
	<49BFB6D8.5060804@student.utwente.nl>
	<ac9c93b10903171019l3074c648r1ba2bfff23a31aac@mail.gmail.com>
	<871vswlybr.fsf@neumann.lab.ossystems.com.br>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] rename packages/ to recipes/ per earlier	agreement
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
X-List-Received-Date: Tue, 17 Mar 2009 20:00:08 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Tue, Mar 17, 2009 at 04:54:32PM -0300, Otavio Salvador wrote:
> Frans Meulenbroeks <fransmeulenbroeks@gmail.com> writes:
>=20
> > 2009/3/17 Koen Kooi <k.kooi@student.utwente.nl>:
> >> On 17-03-09 00:32, Denys Dmytriyenko wrote:
> >>>
> >>> Renaming packages/ directory to recipes/, as one of the several=
 structural
> >>> changes, was proposed by Koen[1] and agreed/approved by many. S=
ince Koen
> >>> currently doesn't have time/ability to do the change, and some =
people are
> >>> too eager to wait any longer, he asked me to do it. Please ack/=
nack.
> >>>
> >>> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/2=
1326
> >>>
> >>> Denys Dmytriyenko (3):
> >>> =A0 rename packages/ to recipes/ per earlier agreement
> >>> =A0 recipes: fix hardcoded instances of packages/
> >>> =A0 base.bbclass: fix base_get_scmbasepath() to look for recipe=
s/ and
> >>> =A0 =A0 fall back to packages/ while parsing BBFILES
> >>
> >> Acked-By: Koen Kooi <koen@openembedded.org>
> >>
> >> Now, if you use patchwork, these acks and SOBs get added to your=
 patch
> >> automagically :)
> >>
> >> regards,
> >>
> >> Koen
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-devel
> >>
> > Acked-By: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>=20
> Acked-By: Otavio Salvador <otavio@ossystems.com.br>

Sorry, already commited. Thanks anyway!

--=20
Denys



