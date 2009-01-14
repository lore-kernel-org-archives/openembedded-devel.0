Received: from [80.67.172.39] (helo=webmail.no-log.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1LNESY-0003qt-2I
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jan 2009 23:43:39 +0100
Received: by webmail.no-log.org (Postfix, from userid 33)
	id A709A4BFCD; Wed, 14 Jan 2009 23:37:01 +0100 (CET)
X-Squirrel-UserHash: c3wyGAAN
X-Squirrel-FromHash: AFRWVV5aWSo=
Message-ID: <55120.AFRWVV5aWSo=.1231972621.squirrel@webmail.no-log.org>
In-Reply-To: <496E4ABD.3010605@gmx.net>
References: <496E4ABD.3010605@gmx.net>
Date: Wed, 14 Jan 2009 23:37:01 +0100 (CET)
From: GNUtoo@no-log.org
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.9a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: write access for GNUtoo
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
X-List-Received-Date: Wed, 14 Jan 2009 22:43:42 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> Hi,
> woglinde and me are proposing write access for OE user GNUtoo.
>
> He has been working with OE for a while now, contributed a few bug
> reports[0] and recently started to work on more complicated things
> (namely Perl).
>
> Opinons?
>
> Regards
> Robert
>
> [0] -
> http://bugs.openembedded.org/buglist.cgi?query_format=3Dadvanced&short_=
desc_type=3Dallwordssubstr&short_desc=3D&long_desc_type=3Dallwordssubstr&=
long_desc=3D&bug_file_loc_type=3Dallwordssubstr&bug_file_loc=3D&keywords_=
type=3Dallwords&keywords=3D&bug_status=3DUNCONFIRMED&bug_status=3DNEW&bug=
_status=3DASSIGNED&bug_status=3DREOPENED&bug_status=3DRESOLVED&bug_status=
=3DVERIFIED&bug_status=3DCLOSED&resolution=3DFIXED&resolution=3DINVALID&r=
esolution=3DWONTFIX&resolution=3DLATER&resolution=3DREMIND&resolution=3DD=
UPLICATE&resolution=3DWORKSFORME&resolution=3DMOVED&emailassigned_to1=3D1=
&emailreporter1=3D1&emailcc1=3D1&emaillongdesc1=3D1&emailtype1=3Dsubstrin=
g&email1=3DGNUtoo&emailtype2=3Dsubstring&email2=3D&bugidtype=3Dinclude&bu=
g_id=3D&votes=3D&chfieldfrom=3D&chfieldto=3DNow&chfieldvalue=3D&cmdtype=3D=
doit&order=3DReuse+same+sort+as+last+time&field0-0-0=3Dproduct&type0-0-0=3D=
substring&value0-0-0=3DGNUtoo&field0-0-1=3Dcomponent&type0-0-1=3Dsubstrin=
g&value0-0-1=3DGNUtoo&field0-0-2=3Dshort_desc&type0-0-2=3Dsubstring&value=
0-0-2=3DGNUtoo&field0-0-3=3Dstatus_whiteboard&type0-0-3=3Dsubstring&v
>
> alue0-0-3=3DGNUtoo&field0-0-4=3Dlongdesc&type0-0-4=3Dsubstring&value0-0=
-4=3DGNUtoo
>
Some things I worked on aren't in that list because they are not FIXED
yet,simply because nobody commited them
a better list would be:
*initial not-splitted recent(at the time) wesnoth recipe that remplaced
the old one: http://bugs.openembedded.net/show_bug.cgi?id=3D3736
*xboard_4.2.7 recipe http://bugs.openembedded.net/show_bug.cgi?id=3D4832
*fixes for scummvm(now build the engines(a script broke it))
http://bugs.openembedded.net/show_bug.cgi?id=3D4958
*new frozen-bubble(2.2.0 instead of 1.x) recipe:
http://bugs.openembedded.net/show_bug.cgi?id=3D4965 and a dependency(
http://bugs.openembedded.net/show_bug.cgi?id=3D4966 )
*some initial and unfinished work on boost_1.36(made it compile and
package on my machine(didn't work before) for openmoko and angstrom(so
with thumb support) ) but I didn't made the 3 packages installable
together on the same target
http://bugs.openembedded.net/show_bug.cgi?id=3D4977
*some minor bugs(such as foo lack bar dependency)


