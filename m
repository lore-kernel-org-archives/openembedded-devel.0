Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1Ovwna-0000ki-Ft
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 20:33:38 +0200
Received: by eyb7 with SMTP id 7so321036eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 11:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=XZxPY6HzjvcDQdiGVdAHrqlBpM7BOhn8zM9FIvP6uoY=;
	b=k8Y4sUFedIFd9SN6J3Uf/Ex+80fK80Gr4GZamufnl01tKZs71eyk0LLlKOVIydJ0nG
	Kwpm5uXdIMRLWAfgzCADht9EQcDmPvBW0OLccQ+2x/qIv6KaRaIWrsXwKtdL8R1tbYY3
	p0d0Hd7wbHWxDCsf+yxIZv/ZflJ/RC80y0cv8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=YyG4K1OBQocxSiUryOUlUTM9WeAqqKyuluqeTF6uW0T5vBX087H7jtkuBDWwV/aegq
	gvLXvPhy23vvMOxq/hMapBuPWHPlUqmM20OsSQbptqnAeFbvriEA8cOm8yXVT9UlDxAh
	mDxwth9xLORlhOr/ALnyER90t9io/5n5qo2t4=
Received: by 10.223.104.199 with SMTP id q7mr944858fao.6.1284575571162; Wed,
	15 Sep 2010 11:32:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.121.5 with HTTP; Wed, 15 Sep 2010 11:32:31 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Wed, 15 Sep 2010 12:32:31 -0600
Message-ID: <AANLkTi=vSWgp8MpCRDOhE=3x_d2WPgvKsc4Qy9Y5j7O1@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: vimrc and vim defaults
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
X-List-Received-Date: Wed, 15 Sep 2010 18:33:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Why does vimrc go in /usr/share/vim/vimrc rather than /etc/vimrc like on
other distros?

Would it be a sin to include some "reasonable defaults" so that it's
actually the vim that people expect rather than vi?

AJ ONeal

