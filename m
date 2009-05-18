Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hariseldon78@gmail.com>) id 1M63RM-0001uI-1j
	for openembedded-devel@openembedded.org; Mon, 18 May 2009 16:03:40 +0200
Received: by ewy20 with SMTP id 20so4007806ewy.12
	for <openembedded-devel@openembedded.org>;
	Mon, 18 May 2009 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=VIXbunvPmmLNzScwZJkl7ub1dvdvAcuzBXaTbncv3Cw=;
	b=HLc98FKlJP/NnTZHLU8U/SYD+3hLzqCdJDOnx+9uUl6rWv15IXXtUfEJ617RwTsYPw
	ZiRV4gf8DxAPGvEjguvVCpiuE3Y8/MCuEeBRA3TIUyAtYEGjYGzslgMVGlCFWOM//sc3
	iht2OdhSuZkekTdfWbG4IBo0vjCAV3vZFSjb8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=QNpbapKDUHTDkPmGeyDEklZzyHBWyPHT1pJycfqnRZMoqXaSaw2Vh62UY6eXk52x9X
	vLQ3VRTjTje7YHV2hy27ko1K3N59USRKtkawHs9yMDcrNMXMAOBcV6q9n43kAQm/KQQh
	w1bdxGaVuspG8N1NF54gHQihUr43npTtAubIc=
MIME-Version: 1.0
Sender: hariseldon78@gmail.com
Received: by 10.216.18.195 with SMTP id l45mr2107995wel.59.1242654981889; Mon, 
	18 May 2009 06:56:21 -0700 (PDT)
Date: Mon, 18 May 2009 15:56:21 +0200
X-Google-Sender-Auth: 7a9429770d9006b3
Message-ID: <aee831ab0905180656q31941a95jeedf18f65343c27f@mail.gmail.com>
From: Previdi Roberto <previdi.roberto@gmail.com>
To: openembedded-devel@openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: asking for patch review
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
X-List-Received-Date: Mon, 18 May 2009 14:03:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello. Please could someone give a look at this patch for the zenity
package?
http://patchwork.openembedded.org/patch/433/
It's been queued since 20 days ago, and many more recent patches have
already been reviewed..

-- 
roby

