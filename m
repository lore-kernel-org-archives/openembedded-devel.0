Received: from [64.18.0.24] (helo=exprod5og112.obsmtp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>)
	id 1LcGOd-0004ib-Ik; Wed, 25 Feb 2009 10:49:43 +0100
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob112.postini.com ([64.18.4.12]) with SMTP
	ID DSNKSaUTeeVvq8vgYl8ce4ir7clMczHpqAbs@postini.com;
	Wed, 25 Feb 2009 01:46:35 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Alpmlip04.e2k.ad.ge.com with ESMTP; 25 Feb 2009 04:46:33 -0500
Received: from ind-3n4b83jh1.amer.consind.ge.com (HELO [192.168.219.128])
	([3.138.54.81])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 25 Feb 2009 04:46:31 -0500
Message-ID: <49A513AA.9080201@gefanuc.com>
Date: Wed, 25 Feb 2009 09:47:22 +0000
From: Martyn Welch <martyn.welch@gefanuc.com>
Organization: GE Fanuc Intelligent Platforms Ltd.
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: Using OE <openembedded-users@openembedded.org>, 
	openembedded-devel@openembedded.org
Subject: Discussion regarding the future of OpenEmbedded mailing lists
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
X-List-Received-Date: Wed, 25 Feb 2009 09:49:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

This email is mainly targeted at those who are subscribed to the "openembedded-users" mailing list, who are not also subscribed to the "openembedded-devel" list.

There has been a proposal on the openembedded-devel mailing list to re-organise the lists provided on openembedded.org. The re-organisation has been discussed as part of a larger discussion into the procedures that are used to review patches/changes to Openembedded, that aim to make the process more efficient and transparent.

A proposal has been put forward to merge a number of the mailing lists. There are currently 7 OpenEmbeddded mailing lists with the following purposes:

Openembedded-announce - (no description available)
Openembedded-commits - Commits to the OpenEmbedded metadata repository
Openembedded-devel - Using the OpenEmbedded metadata to build Distributions
Openembedded-issues - OE Issues
Openembedded-stablebranch - Discussion and review of changes to the stable branch and its policy
Openembedded-users - Using OE
Openembedded-private - (no description available)

The role each of these lists is currently poorly defined and in some cases either a list has too few knowledgeable/key subscribers to properly answer the questions asked, have overlapping objectives or would better serve the larger Openembedded community by being merged into a more active list. The proposal is to merge the list to form 3 better defined lists:

Openembedded-devel - for humans to post patches and ask questions
Openembedded-commits - commits, bugs, logs, etc
Openembedded-private - core team

The plan (as I understand it - please correct me if I'm wrong) is to:
* Close OpenEmbedded Announce, It seems to have received no traffic since April 2007.
* Merge OpenEmbedded-issues into Openembedded-commits. This list will be for fairly verbose automated messages and as such high traffic.
* Merge Openembedded-users and Openembedded-stablebranch in to Openembedded-devel. This will form a single list for the discussion of changes and issues regarding the Openembedded platform and to ensure all users and developers are aware of up coming changes and have a chance to be involved in any discussions. It is believed this will also aid with spotting changes that should be ported from the development branch to the stable branch and visa-versa.
* Retain Openembedded-private for private core-team discussions.

Initial support on Openembedded-devel has been very positive, though the views of those subscribed on the Openembedded-users list are also important. Objections, suggestions and support for these plans are welcome.

Martyn

-- 
Martyn Welch MEng MPhil MIET (Principal Software Engineer)   T:+44(0)1327322748
GE Fanuc Intelligent Platforms Ltd,        |Registered in England and Wales
Tove Valley Business Park, Towcester,      |(3828642) at 100 Barbirolli Square,
Northants, NN12 6PF, UK T:+44(0)1327359444 |Manchester,M2 3AB  VAT:GB 729849476


