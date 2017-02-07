Return-Path: <olof.johansson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id DE90965C8F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 13:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id A6EBF2E5DA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 14:34:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 59jXQ2tB68aU
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 14:34:09 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 7FBDE2E5D8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 14:34:09 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF88C1E07A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 14:34:08 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E42C01E06A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 14:34:08 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 14:34:08 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id D86A0726
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 14:34:08 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id C47059C09F; Tue,  7 Feb 2017 14:34:08 +0100 (CET)
Date: Tue, 7 Feb 2017 14:34:08 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170207133408.GR31993@axis.com>
References: <1484904671-9257-1-git-send-email-olofjn@axis.com>
	<20170207125411.GQ31993@axis.com>
	<CAKuJqM_-UAdCfLYHqwe7Y23mZBiSEB7U7j9ekQ4TShgco3P1vQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKuJqM_-UAdCfLYHqwe7Y23mZBiSEB7U7j9ekQ4TShgco3P1vQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
Subject: Re: [meta-webserver][krogoth][PATCH] apache2: always use the archive.apache.org to ensure older releases are always available
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2017 13:34:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 17-02-07 14:12 +0100, Oleksandr Kravchuk wrote:
> Olof -
> 
> This change is already in 'master'.

Yes, I know. This is a request for backporting to krogoth. (And
there's a separate patch targetting morty, but didn't feel it
worthwhile to send to "ping" emails.)

-- 
olofjn

